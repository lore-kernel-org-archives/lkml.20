Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854969;
	b=oeQ7DOyYmNn098UOP3J6bryoH+Ucoj6SxvEeecLFBIum86Nrl1eHClfnxfYbD6xHlRt8
	 jIaxmnYPn4y3ZYF1VDLAH8hr5ZOvxJKPNWsOb/IIyS8ag6VQscXcbBXLXR/udEkJyOPu9
	 sjwmIlNvRR1b4Z6MekpcQ/6kFm8Sm7ybJrNuuxd+9D85Tr4nJeUnBOMJT/b6kkwc6vP39
	 Uk7eCfPixMclTot0ll/hQGBvFruvB/XvLNV7Pcp3F1h/gnbzOT0TUg95DhWboSz4pREEg
	 x57YpWAaVicf6ESUgQC/X6Sw9KM11yJYlVJ7PSYBglLbi1E4KCxQ7M+SGQJ+hgxgxsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZvR6TskZdWW0qqXirA6k1L3BiqLi1sfGsfq7tJ5wLss=;
	b=NdMNx0PAJK34W/xenC+DQEMObM9uelWbLMmljQ5htxpRhjkGRrA80biTuaZSJNkYfHAK
	 065NnJUj+68br2SCEKjNiiZCryanwIdmgWSbm3nPF6NstIj9JQYrMaAj8aNXJ0eSC7TWp
	 q8+aCs45v3OegYIRXi96XjQt0WvPBInIG3Ch2DzD/WQTzjIQPAQcspwW6YjO+pyz08c9C
	 +QvqLlhC4ieXLvapal/YhfGYPc6wKHvOFySKJGOTykbuR7lNDRC36RWafpca7hUQy68F0
	 YvwxEUxXKsuyNBf99/b7Dz7sTlF/XR/T1r7ppNhdrr6hCfGV4P91ntrT6EP5ZW5G4mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVqH7DZb;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5EF606D808
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C5EF606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVqH7DZb
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso491246c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793854969; x=1794459769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvR6TskZdWW0qqXirA6k1L3BiqLi1sfGsfq7tJ5wLss=;
        b=iVqH7DZbiXYw9I1iVCOjZ4e9C4Zj9/4MJHBezBN7pD87q4SvUWBwXrtJ0712sceVUR
         gTEj9SaTAXSRg78VMKO4rSzGIfEO2ZIsAhKT9Lqersq8HIbzx2VfuBENhnYee6LUWo89
         Mzg5IVoS2EbjHSPJYEnrLr9ysmuj3LZBkFFEv/iw8HhzS/ss0woub3STdsy4wtFVaEr/
         CfPkxVsI2GMqdOmgw2y+ixrXPdzoeBktMtV9flcUiuk3csIXxTkESHrHRxV6RwZj7Ajk
         ff97Mr2c5lUhf8VKXAZY/9FUMhbt4fdBemrTWsuvFmY2Ok75cUH62NKj0dfX8ogFPceX
         3dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854969; x=1794459769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvR6TskZdWW0qqXirA6k1L3BiqLi1sfGsfq7tJ5wLss=;
        b=A6TS1mbhSCdQDrwhcfHzt4n+8vu7ty8Tg+uDfaig/Y4CzC9FeLCSYy3/B1g6t/Czsu
         s2XA9fpYfMO+mYsfuvAPMgqID2q0GD+eBwb8ZyiiWdCw+W4cw7R8NwB6gnx0+3eSsN35
         RENg6QsyDVMj/SEaZ5EPxI4k2AM3buElS6F0a1EXylsUJsXzq7Ikw7dSYQqUbx77nlj2
         PlFd44NsSnsCHglUkIENcugt8NRiB9XvL2jN0hFYHLcpNL+b7U7FlBOxR2L4CqrXytJS
         0tUxLXlZiDbemh43QQ1qAOBX2HCoEvV8V0mvAPafidP+BIpSzHojLbcT+FVD/SnG1Efs
         2BlA==
X-Forwarded-Encrypted: i=1; AKwUvBz01H617xigzbDC0qJalQfbokD8bd9wc4QUdS04ZtrwytD9hsne4JNhkYuD90drdkiTnss+DOL1yNgOFmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MYFVCxyHXzmhYVdkIcZSMQ8YZL/TaKJNIu65KuUR9vEEUd4Bq
	qbCZ+TIfw2G3f3WzwTIB4/wEX7gfTAXm09ZOfAq+qTkbGzonJ65YuGvx
X-Gm-Gg: AYBFou39WSBENMJCtvYHiGWbTfmFQ5UDtibD7lLPs6G2jI7kDJnDKhM84669seX1kLb
	yZ47iDhCLWbbVbbqgsvriglSnNFrxMDLqm5x4Rn6L2nfRskd8KdKVVY4wWf6blZxHLdznlN5ZAK
	qB+v4e7lmXHdiMy7CtY3PTvO5zzMvpFfJp3zXGpLADVIPJ6TrR/T7sQDw3Ilb3T6fimKhNb2DIn
	QiJVpLp43PDVesPZtdCpgHqDb2GNQfm2HbB7k0dEiDnCVy7YSyy6EBhM+hu9ZUUP1D5K1PTG0rc
	0+c5ckfQuh9Q/D/m1JCs0KqY2aI9rO+Crsu/xd76a+12o/M63NCrmVSU2UEEX7oAScpImhBas0V
	H+mabZg2yc6cg+N+fuEeYNlRxyqHzI5O6Ada1qMoKAEAmoC4kLl2l7ej/6VY46WonwHHXNtNLMb
	KdDMgSH57m2XaHWuXoiKGvH4Fsw/nk08RRQR69lS+o2Wi4KT2ALDcZDGN4YprIGinttr8RDpDvc
	fi2JtdpTH0phx7DC0+HZA4GbWixZD5cH8nxDcEBnQqguy4mkOsgATZpq/ILmMJFI5iR1iWHEUBF
	Xnpo1wMCEGA0BZDPNcQQnvOK75OeB0/UbTJL/Rr2/Z/3elz8AtdV0qfJzont7bXZp/2BUi/eewA
	=
X-Received: by 2002:a05:7022:29c:20b0:15a:9834:73f2 with SMTP id a92af1059eb24-1ac5c5554eemr25709808c88.38.1793854968501;
        Wed, 04 Nov 2026 21:02:48 -0800 (PST)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm13626735c88.4.2026.11.04.21.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:02:47 -0800 (PST)
From: Tim Budding <tim.budding@gmail.com>
To: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org
Cc: lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Budding <tim.budding@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/4] sctp: abort unordered partial delivery when its message is skipped
Date: Wed,  4 Nov 2026 21:02:22 -0800
Message-Id: <20261105050225.49292-2-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105050225.49292-1-tim.budding@gmail.com>
References: <20261105050225.49292-1-tim.budding@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an I-FORWARD-TSN skips unordered messages on a stream,
sctp_intl_skip() only aborts the stream's unordered partial delivery if
the MID being delivered is lower than the skipped MID. If the skipped
message is the one being partially delivered, partial delivery stays in
progress: no PARTIAL_DELIVERY_ABORTED is sent, and the next unordered
message on the stream is delivered as the rest of the abandoned one.

Abort the partial delivery when the MID being delivered is at or below
the skipped MID, as the ordered case already does.

Reproduced on an unmodified kernel with the uo_pd test of the
sctp_ifwdtsn.sh selftest added later in this series; its partial
delivery checks pass with this fix. Reproduction and fix done with AI
assistance.

Fixes: de60fe910543 ("sctp: implement handle_ftsn for sctp_stream_interleave")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Budding <tim.budding@gmail.com>
---
 net/sctp/stream_interleave.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sctp/stream_interleave.c b/net/sctp/stream_interleave.c
index 840f24045ae2..869940001588 100644
--- a/net/sctp/stream_interleave.c
+++ b/net/sctp/stream_interleave.c
@@ -1255,7 +1255,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 	struct sctp_stream *stream  = &ulpq->asoc->stream;
 
 	if (flags & SCTP_FTSN_U_BIT) {
-		if (sin->pd_mode_uo && MID_lt(sin->mid_uo, mid)) {
+		if (sin->pd_mode_uo && !MID_lt(mid, sin->mid_uo)) {
 			sin->pd_mode_uo = 0;
 			sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x1,
 						  GFP_ATOMIC);
-- 
2.34.1

