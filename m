Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794096171;
	b=VcxqmkQjcWHdUPqk13KeB3nSby11gpZ5K0OSqO21HMeejjQAhfWXoJBO4tg3+/YpevQh
	 tHII27uLtVgzBfZhBrGuV+EfoQ8h10CXqijp6M8NSMPH6EFgmhnOOSoWiNma9Q6RBca71
	 4I812zwbSCMsmga5Q0vm7vg8YMQaOoIW18rISM89z1yQYEvVifqSLUCbfJeUNfvfr/mX8
	 X4d0fsDC2290oRcL0oPCLX4fOokeDYV1VD9HEJ5/HchsSxtJAntax/6vmpkQNSJrxtr76
	 oMehMHHW0ajYn7yf5k/MaoNjN82wHoc2sEEZgRYMTKPYPdh1/4nEDIOygISP3jABI7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096171;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lzdyOPLVvys2PO51ofYN+JrYeEYMHimfW7wg6labGXM=;
	b=Wy9risb2CnnKwV5GnviR3uV6U9wNmSgEGI+IPQPy2UvFGa3kwABSUCcCDJOFBdyIjbkt
	 2V9i8nQ2XPG+Vcq1HqYdaPIaf3KjAu4NcnIAf2PDCui3oVtq1z60Y9mRrbDdySCgiNvAa
	 8i4QkGXjew+MFR5QC5dlwcmyl5HnYPP/FsQGYNQtDzE9wRNMte8qNRq6vMOC5a1kk2Wj1
	 Ii2KMnwEQtbl/P8oD2uWQoACRcKCaS698ZLfY+AmtQ9TnSq4X/Bb8pA+SqY2m98Z6ndas
	 6Ceek2Z2gah2E9CcY0ldw5YUHCU1vjUQU1jMdgmSkBescwUKfzZnkFiHirxzSdDecDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcBTdfSI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6FB606A33C;
	Sun,  8 Nov 2026 00:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcBTdfSI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794096170;
	b=AZoozl56fF7M+cQETtFxBNRVphVho9i4Ib489yiYmrt2j+EJj3c9HO7mqe00cu97x8wL
	 /r7Ky5ujjf88wo4V1ImmZZ67RmG1XIMNSYDbXCjs87NFflywEo27f12UwXCSjY1tbecnD
	 1oW2nQW/nPba2KPAZZqQHtqWrj7pGrN7CZkxl9l32lFXDn/UfqyVlcN4xdqp2aRbE6Gi0
	 KLxAg00vQyY/GkP+/68wKre5zdfP0U7sgYlfFOlWxgpPzY+z+kZbA8qWpR+Ry+D7yk6Qh
	 P/KvmpBZisJCtCrg7HbphVzA6uXvyxRkTvnFQgZAm9EZvuhcaeFAwUX/z03k8qPBrfA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794096170;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lzdyOPLVvys2PO51ofYN+JrYeEYMHimfW7wg6labGXM=;
	b=jSH5sFZ/ktxkMp6pk604O/mJaCFlL5t2MZ4Gne+Ivj8YKNWsBmhQe+0d7YQ427J0ZUzV
	 jejqlj4DHF2qfpFhbniWAyuz+FUkIvYvMjnWQgBgz8v96uwLBbjdpaPdLEK8nWE5BPjo+
	 w8Hof8AudKrudJcUr5jB9nvb0CVyEj4QD6TsBrSsqbwKUtVBm/PrPnWr61ilncBOfX8Yb
	 4LA8PMi8rHH33n5J/aufGMYF3xNvaw+o0p38maQZHhY45J47CuJfux1T1RbOxapAL5yV0
	 XAkPL04QZUUV4XdgnnFixKa+w/Mf1cndbJW1/qApbhIc61aLXTdvjBdIiBTIUDjp7Zw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A30D1F0089F;
	Sun,  8 Nov 2026 00:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794096170;
	bh=lzdyOPLVvys2PO51ofYN+JrYeEYMHimfW7wg6labGXM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TcBTdfSI6QG55kkneEyXk63HHFpBRmCUBxyE+guX87+QR05sOLiuCLJ0jCkmV5H9s
	 wmwyHV9lQ4lAYWA2g10gWvW8nQHaLLiowGnt/Lx72Q6LFUUWx3pBAdX16sVXQ30qbX
	 8hPHBh0/mhT4wjVbTC3R2zRXFKUJ5lCBUO8AMKTQJkTw1CgLk+bdlJVIY6j37KsIlg
	 UYvXkoeyrs/oKtE7EordCivwNdpEeOQPJPuYEVaCg/mI7J2Se7dJuYWcoWig9qo3TI
	 MFselhvvmlyE+UjP6KhnZDbbnAcVdUt9ba2R0rhXulIkoIxaeE+KTsyH4taZ7McoST
	 KI1HGeGjWrlOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8ECAD47D5E;
	Sun,  8 Nov 2026 00:02:49 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 18:02:50 -0600
Subject: [PATCH wireless] wifi: mac80211: keep the operation elements of a
 duplicated beacon
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-mac80211-beacon-dup-oper-v1-1-560a1bda4c92@gmail.com>
X-B4-Tracking: v=1; b=H4sIACm872oC/yWMwQrCMBAFf6Xs2YUkFG39FfGQJq+6oknItiqU/
 rtVj8Mws5CiCpSOzUIVT1HJaQO7ayhcfbqAJW5Mzri9tebADx8646zlAT7kxHEunAsqo+27Fj3
 G6EBbXipGef/WJ3pJxR2qdP4bnYcbwvQ907p+AFc/nfyGAAAA
X-Change-ID: 20261107-mac80211-beacon-dup-oper-e4984e9efd2e
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794096169; l=3611;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=DCAiZMD10Y1x+ygXE8qpchuzeKQmywabx9INKvjeu68=;
 b=AQVQ4PtsT03ZaN0enKk+fOAGv/j+yDwTbuGIaAfepgK/U4UNs7GJCLFxxWDG2zsgBlLsYlLhE
 3nD0V62OsriBt4N9X7AgLiWMdJKeoDQ5Vn+1LGGh8bUx4Y3WfPhX+J+
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Reply-To: christophergriffin05@gmail.com
Content-Transfer-Encoding: 7bit

From: Christopher Griffin <christophergriffin05@gmail.com>

Since commit c9b62ab79133 ("wifi: mac80211: fix per-station PHY
capability bandwidth"), ieee80211_assign_beacon() derives the AP's HE
and lower bandwidth from the HT, VHT and HE operation elements of the
beacon, and updates every station when it changes. nl80211 finds those
elements in the beacon tail and passes pointers to them, but
cfg80211_beacon_dup() doesn't set them in the copy.

mac80211 installs such a copy when a channel switch or a BSS color
change completes. With no operation elements, the bandwidth comes out
as 20 MHz and every station is set to 20 MHz, until hostapd's next
beacon update sets it back.

On an IPQ8074 AP with ath11k, every channel switch, also one to the
same width, made ath11k send the firmware a 20 MHz peer bandwidth and
phymode for each station and the right ones about 10 ms later. Once,
after a switch from 80 to 40 MHz, the AP kept sending to a client at
20 MHz until it reassociated.

Point the operation element pointers of the copy into its tail.

With the change, on the same AP, a channel switch at the same width
left the stations' bandwidth alone, and a switch from 40 to 80 MHz and
back updated each station once, to 80 and then to 40 MHz.

Fixes: c9b62ab79133 ("wifi: mac80211: fix per-station PHY capability bandwidth")

The change, this message and the test were written with Claude, an AI
coding assistant.

Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
Found on an Arista C-360 (IPQ8074, ath11k) running OpenWrt: ath11k's
debug log showed a 20 MHz bandwidth update for every station at the end
of every channel switch, followed by the right one, and a stack trace
put it at ieee80211_csa_finalize() -> ieee80211_assign_beacon().

The BSS color change path installs a cfg80211_beacon_dup() copy too
(beacon_next), so it should have the same effect; I tested only the
channel switch.
---
 net/mac80211/cfg.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9608c07bcea7d..7356788a8d060 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -4586,6 +4586,18 @@ static void ieee80211_end_cac(struct wiphy *wiphy,
 	}
 }
 
+static const void *
+ieee80211_dup_tail_elem(const struct cfg80211_beacon_data *old,
+			const struct cfg80211_beacon_data *new, const void *elem)
+{
+	const u8 *pos = elem;
+
+	if (!pos || pos < old->tail || pos >= old->tail + old->tail_len)
+		return NULL;
+
+	return new->tail + (pos - old->tail);
+}
+
 static struct cfg80211_beacon_data *
 cfg80211_beacon_dup(struct cfg80211_beacon_data *beacon)
 {
@@ -4639,6 +4651,16 @@ cfg80211_beacon_dup(struct cfg80211_beacon_data *beacon)
 		new_beacon->tail = pos;
 		memcpy(pos, beacon->tail, beacon->tail_len);
 		pos += beacon->tail_len;
+
+		/* nl80211 found the operation elements in the tail */
+		new_beacon->ht_oper = ieee80211_dup_tail_elem(beacon, new_beacon,
+							      beacon->ht_oper);
+		new_beacon->vht_oper = ieee80211_dup_tail_elem(beacon, new_beacon,
+							       beacon->vht_oper);
+		new_beacon->he_oper = ieee80211_dup_tail_elem(beacon, new_beacon,
+							      beacon->he_oper);
+		new_beacon->eht_oper = ieee80211_dup_tail_elem(beacon, new_beacon,
+							       beacon->eht_oper);
 	}
 	if (beacon->beacon_ies_len) {
 		new_beacon->beacon_ies_len = beacon->beacon_ies_len;

---
base-commit: c4328134f3f7c2ce141121a8f82a5ec0cc8a709c
change-id: 20261107-mac80211-beacon-dup-oper-e4984e9efd2e

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>


