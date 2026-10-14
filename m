Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6E31684B0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791955395; cv=none; b=qRQvBD9OpWP81iFLY7gE+shXSJz8Ph5jFphy2c/VuL08WD391iDFqO3CV463UnoOpZgbqG6v9X3z3BoND1iChkBopoBm9RowPuONrDplBt++SQjgb/rtcOBjW1LzatWxQDkh29Xs6OrGn0iyKyeCFx6FzGUeea3ErQyH7fEJzk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791955395; c=relaxed/simple;
	bh=9ZcuQxhf8efgf6EBDA4WRKi21U1OXSfxwz+kGTqjfJA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WjtjbSb5xapw5zsyg/zGCbVVetjYRI55c0bO8K1TFBFBV3OQFU8Iqr87qOXbtNN7BCk+bo1b3gOILi/r0D8T3sGV1Cb1UvfoHYDwazPQow1++y28XZs7f/uXk0V0jg5XUI7VuOyL31lcxwBvaJA9/wTZ9XGfNQSMmfjwNLD6KGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=jwtvE2+E; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="jwtvE2+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791955383; x=1792214583;
	bh=Zq9sMICpVCiWyLkwpxHeqDMbAAaX7+gF6NfiADYu6Bs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jwtvE2+E344UCWuZ1kL4YG3DLZvbQ9+oeAjKO+DhhMFZ+XvUFxD3S/y636jZM8trN
	 zPx1YYzb+cfXdlE2xjSMxiuPTGxEJtwXaprhQ+N7fVXniq/rWmErtEwyLbPnrXsdYy
	 tsClc4xHyZJOsZA7d2lmPHJwX6Lc5VXH8heYWHv2ROCC2pU9E8JplBoOeYA1uXemLn
	 uUrT2l4uOGVmNnaoCAjK9oNu/lNNae/bOR8nzf/Cd9twSZXv3Rpn0tGQ49q2lign51
	 JDUfonIyDCoeDhS4OUd9qDgIr5GFqgq5XZHMdZw2HrF4ge/SHnLDY3wWV1dyTK+0wc
	 DBxveMsSrSLzA==
Date: Wed, 14 Oct 2026 05:22:58 +0000
To: linux-bluetooth@vger.kernel.org
From: Kyle Pepper <cochcoder@proton.me>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci: Represent advertising report payloads as bytes
Message-ID: <20261014052244.416087-1-cochcoder@proton.me>
Feedback-ID: 97716137:user:proton
X-Pm-Message-ID: a29679195086d43955a75f0ff2f2d25f8f70278c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Advertising records have variable-length data and cannot form a C
array of flexible structures. Describe the report payloads as bytes
to avoid Sparse warnings without changing their wire layout.

Assisted-by: OpenCode:gpt-6.1-sol sparse
Signed-off-by: Kyle Pepper <cochcoder@proton.me>
---
Separate cleanup of warnings inherited from upstream, not a v2 of the
UB500 shared-buffer RFC. The same two "array of flexible structures"
warnings reproduce on that RFC's parent and exact submitted commit.
The public bot report only contains the matching include-file note;
its complete Sparse output was not available.

Testing:
- GCC W=3D1 C=3D2: hci_event.o and btusb_main.o, no diagnostics after clean=
up.
- Exact submitted UB500 commit plus this cleanup: same clean checks.
- Strict GCC/Clang layout checks and LLVM/32-bit hci_event.o builds pass.
- GCC hci_event .text section is byte-identical before/after cleanup.
- A guest carrying the cleanup passes pairing and both HoG variants
  on baseline BlueZ and each of four independent ASHA topics: 15/15.

This does not change the UB500 quirk or certify an unseen complete
remote Sparse report. No full architecture/configuration build matrix
or physical hearing-aid regression test is claimed.

 include/net/bluetooth/hci.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 1641d879d..e873ffc15 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -2972,7 +2972,7 @@ struct hci_ev_le_advertising_info {
=20
 struct hci_ev_le_advertising_report {
 =09__u8    num;
-=09struct hci_ev_le_advertising_info info[];
+=09__u8    data[];
 } __packed;
=20
 #define HCI_EV_LE_CONN_UPDATE_COMPLETE=090x03
@@ -3058,7 +3058,7 @@ struct hci_ev_le_ext_adv_info {
=20
 struct hci_ev_le_ext_adv_report {
 =09__u8     num;
-=09struct hci_ev_le_ext_adv_info info[];
+=09__u8     data[];
 } __packed;
=20
 #define HCI_EV_LE_PA_SYNC_ESTABLISHED=090x0e

base-commit: 609a23989d637e2f90522a37c62e65c8c9b8b0ff

