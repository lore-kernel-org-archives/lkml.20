Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794176835;
	b=K4yAVeS+GSH7miqBAeGVJG9R8e5cGKv40KfSsXyl07vxoTaIo7JxPv+HFI4WR/Vewa3k
	 d15iEIdWH2OK7MFQhJEeCNXZSkJavzG2EUucOic2NtdZgfL1iemg+fLNk/vjUuTWxfaTa
	 2xbtGt5BEil2oqqt9ulIUv5cwMr0Op1YTpfW9sm05+b5qyY/i70Po292Y4pLJP/p/Q3wD
	 p2hgzjWRSeaAlzjawNF/E2Rw3OCRch2sSM8h1bxtmxj1UKfLH4kZt5h4m5n/u+PCYZwfx
	 MzQNCVQ19AyeFRHo3pd3+CD3288yyGuLI7HR/qR+F903ivSQmp+jICXQ2o+hohLi2Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794176835;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7JvDAbjxoc6LcQJF1QmS7ACxv1pf58YmWYVxzHguFXo=;
	b=fSg2jpAgIz3N9CRGKMAhtkBH6utvPZdLxfg9Fnnc7Q2q78JK0G9l+L8UJ6k1pwXggF3y
	 wWW84hzG8l6ERcF5rGQrTAm9QbrL4+JmA7YqgjfcgNiF1OJj9GLrfuyPZ5xQ9nQECUueR
	 RyB72pny9nKZOejW2FKEixU7DsNrcBm1A3WEj7Jbbhjmjhd6FxDUybWl6a7TaZ6lU5682
	 XCT594/8nLhr9JrjkvXgKkZr9ayKQef+N9Ixg6rTgGQS6yWC8RJHlLhjuJaq17oA4JNnd
	 DZ3EdUBtsNq/MbSbUo/PBbvp093CP52yrqMKmgIvItxMDWoLNHKPTU4xlbojo1lrHYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=lijnUSA0;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7AE606A31C;
	Sun,  8 Nov 2026 22:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=lijnUSA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794176833; x=1794436033;
	bh=7JvDAbjxoc6LcQJF1QmS7ACxv1pf58YmWYVxzHguFXo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lijnUSA0Q5DLWtZZtjbzr17qpxL3zw/ACGdoLfRXDVgRcwmoYU2US2htWqA0llMXW
	 8/3aa/LaZam+1gxYyvT4lEGLzrQ2VZmT6pQ4lHUcBrdMhpk10pvlVGGaHudH5AZiXC
	 CwNg4NA2rdV9TpQJBRpn0ZHQmpHl28qeeL8OHlVawq0ubSf1NjOg+kkIOdE3TO1dCB
	 9iQ6ZdtMRxXWqpukrqaqu5mLVGfu/cnlAxPJmEcsaLXVQy8EwG+JECsX67AMK2N6Md
	 6E46DsxoDiy2+rtX2tI3cVSRMCwoOKdiWOsE9GO3zrDoTLpRijbieB1KVj5trWE3yt
	 1j4gyCRFskqRA==
Date: Sun, 08 Nov 2026 22:27:09 +0000
To: "pkshih@realtek.com" <pkshih@realtek.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "security@kernel.org" <security@kernel.org>
Subject: [PATCH] wifi: rtw88: sdio: check packet length against remaining RX data
Message-ID: <tKht3w_knueblApO8rdPrR1QcEs6-nv-6y_7lYwYWCYqQJJ2ZiPAgcGJZuiQVeotGyIaO3EZ9j_0jFwlc5ESOzzhNSRjQu5vvUGR1kf2MUE=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: f8043fb98b4982508e209ce9eee9f2f73609112d
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

rtw_sdio_rxfifo_recv() validates the descriptor's pkt_len only against
the absolute maximum (11454), never against the amount of data actually
transferred (rx_len). The last-packet branch is taken precisely when
curr_pkt_len + pkt_desc_sz >=3D rx_len - which includes the case where the
descriptor *overshoots* the buffer - and rtw_sdio_rx_skb() then calls
skb_put(skb, pkt_stat.pkt_len) on a buffer allocated for the aligned
rx_len.

The loop's own comment documents that the 8051-class chips can produce
packets whose pkt_len is zero or points beyond the end of the buffer
when the RX fill race hits; pkt_len =3D=3D 0 is guarded, the overshoot is
not. An inconsistent descriptor therefore reaches skb_over_panic() ->
BUG.

Drop the frame instead when pkt_offset + pkt_len exceeds the remaining
rx_len.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), drivers/net/wireless/realtek/rtw88/sdio.c:1352-1419=
 (rtw_sdio_rxfifo_recv), sdio.c:1331-1350 (rtw_sdio_rx_skb), rx.c:295-320 (=
rtw_rx_query_rx_desc).
Loop predates this window (8703B); newly reachable via 8723BS support added=
 in this window.

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wirele=
ss/realtek/rtw88/sdio.c
index dc2fd0f..0a07d8d 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.c
+++ b/drivers/net/wireless/realtek/rtw88/sdio.c
@@ -1389,6 +1389,15 @@ static void rtw_sdio_rxfifo_recv(struct rtw_dev *rtw=
dev, u32 rx_len)
 =09=09curr_pkt_len =3D ALIGN(pkt_offset + pkt_stat.pkt_len,
 =09=09=09=09     RTW_SDIO_DATA_PTR_ALIGN);
=20
+=09=09/* The device may provide an inconsistent descriptor whose
+=09=09 * packet length points beyond the received data; do not let
+=09=09 * skb_put() run past the allocation in that case.
+=09=09 */
+=09=09if (pkt_offset + pkt_stat.pkt_len > rx_len) {
+=09=09=09dev_kfree_skb_any(skb);
+=09=09=09break;
+=09=09}
+
 =09=09if ((curr_pkt_len + pkt_desc_sz) >=3D rx_len) {
 =09=09=09/* Use the original skb (with it's adjusted offset)
 =09=09=09 * when processing the last (or even the only) entry to

