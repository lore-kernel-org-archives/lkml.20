Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D184035C69A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973870; cv=none; b=KlfOcLgywiV2RPG2j0IopSRSw3qjA56XrrewrtCoErVqhJrE5EonhQ04QYEE+MtaGTut3uVRySgx6cULnjGjunqkDQllgjhYjVqJ48pvsr/bTdoc8l9sBZ5XbeHptnBcYCgPN1LOJxFb7Dndp9BvdAaDr743URByKhwgE5eeFpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973870; c=relaxed/simple;
	bh=rc6pysinAtxTWfmbt7G11fkKqor3YnttVUGOKHDnERk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S/oIemd2zq8J5OMHK5m4ib3OBuoZKwyklJX0LYzHPeAb4eUIruSa202Jl93NwgH+TpRWlUheY5xu1bYgRz/5AVTTAMLg12bnWwhkzpNuPaKytjcMJ/b8otiCzvX969KQks556ZAFXER1WQ9SFOOAPq78G779qUnqZ8enGd4+j68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lLstiXsk; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=xkStEwrc; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lLstiXsk";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="xkStEwrc"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689GZCB3162459
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=lpt2d26XTQe1uORrhGycOSTTTO
	JsJUi2+IgNx3gMRHY=; b=lLstiXskjuHaqDqOOrjd9ZcnX3iz6WlMj1mX+8Uxfz
	eQmxdudmLF9VqBgOBqY35n3VSmWb4AzgwVO2ULOoaUdFwWa/q+Amv/pC2ivMCss5
	bZrEGfDJYInPsq+1vMAU/WZNylbsi0GZZKnIi7nVl5o2I+cFzhS57VgNGAd7n50e
	uiF8dFvCBr/2cS7NsVFudvVAHDjVkaaw5NyEvakrfbbNcFzYCbOIMhpSTultiZeV
	OVaClza1+CgwQ9tmvSk2kWmVzxLAHNn4ik/rzpnLz82/T+1AtPUegzij53zTDtlS
	2A6MRXCq8iUIbE/uU7sRsdLdW5XCrcPr8aSpXU4rkEpg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gk4fh3ue8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:11:01 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ef04756caso121428781cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788973860; x=1789578660; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lpt2d26XTQe1uORrhGycOSTTTOJsJUi2+IgNx3gMRHY=;
        b=xkStEwrcLztU4C4HqGzZlTRx9MW1j7T/v2IaBrt19p9JNnn5/3pxCeqTj8WqHiYfH8
         YeshfhY2UbqQ+PDr1wxhcM9/tBXLtpjKDUAUqCrFOmqvRulRu+VISEieTjBTh/HkMEtL
         p497Wlj4zFG4xlMCIpgVYQSu4u3Ld7gQD6se+/O3eYKuoUq/QbE/PvX6Q8SodZqmh0JP
         q4EwTUqxmsr4v6Jh33QfhCaWrHjQawPP8YhOTSojJJi+BK9JGIzpX0VyXT6EPIAREtCI
         5llZuKDkYOWhxyx3X/KlcnIxZlRjHpS+JUBaJEQksyWSbMXsdPdggr02Rvw8Cn7fQOLz
         aRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973860; x=1789578660;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lpt2d26XTQe1uORrhGycOSTTTOJsJUi2+IgNx3gMRHY=;
        b=I/TSX0xToHU6oLXiODK46f4QTnxVZ8koCLz1LgpRDAnBX5hgHPumTbb840wJyttsFP
         ODTpXoXIcaT5FgbAyBVfDXarAKVjdF4oj7g47XcYti/F5x40ahXJzAa+5Qk7JvqeuUKu
         DmXmUQFkE2hBHtWhq325oLJbyX14qluSpF1v25MqusEommFklxcHShgZtwHaim30qgKF
         eAqSoz3CVUc5BP+RcFqXJD0axnyMH7xHeov9QhsTE0deFMXfPRY6JEle3mgq5hLChQYa
         wPDGpZfp8St+tmIsUs9xKdsW+cmak8K3VJ+OsSNEG8ptV53OSDQziOtSlUmkXCOuYXCl
         4kSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLdtcGiDefY+jJIBbZoLGps16XhHFWuTzeKqE89okztRgSaeeEJ7tngrPnt0PHFR3krtS0r9FToA0uyI4=@vger.kernel.org
X-Gm-Message-State: AFuF++m3VbmsRNnb52uO7Zr3WlONzvbPcl2nT34i5k79ylTVfgk1RoS6
	8sYzsJoe4gJND/eKWC6njr/EYlOwybRKFPLc7wrpdioMEQbJnfVUz6XNrgGwbW0qv/z36BhU0HL
	N/UFPWPN/wU9RKMaF4MyofyGXXV7wdFjuNoFO4sFO1MbH/a03ghbbg6KJ56P85w==
X-Gm-Gg: AYBFou2+5BjYqCoJ10UY2Wklo6pLT2n3ZwmdA4LaScJjZaTM0UtINMa0/IyyWeUfmvh
	k984RsQJWfymYHo8SHdME3qpqU/5lzWu1puNalp6z3sD1pek8NNzt/vZssl4bfcSqN/aJHBsmHb
	XTdelD2XPKaVKBZyQWYOmGPcHgSD/A8lsK09gGqKHJW9nYbrXZHlyx9F5oisvICeDKbtahJikRZ
	Cwrd/Iu4yxUrrHu6wU8RwbvZJ97AEBx0H0jeqfFOpr9+mZJE8waS7/qkd8ryup77HMwuiXFyjd+
	mh7REDRIEzFBfH450fGt8IaC18LrnU9qr7iZfhWId97IY/DNeJxcAb8+nnCvkpsQ7ztVacWmLz2
	wv0qhrPYg1YGec2u1oStrBE7ZLLg4tYeNPdxBNs9k3ekdmmEn
X-Received: by 2002:a05:622a:2516:b0:517:8011:3a4b with SMTP id d75a77b69052e-530a2c4243dmr110781691cf.21.1788973859957;
        Wed, 09 Sep 2026 10:10:59 -0700 (PDT)
X-Received: by 2002:a05:622a:2516:b0:517:8011:3a4b with SMTP id d75a77b69052e-530a2c4243dmr110780551cf.21.1788973859333;
        Wed, 09 Sep 2026 10:10:59 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-193.net.columbia.edu. [128.59.176.193])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5308fc10b78sm64927471cf.30.2026.09.09.10.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:10:57 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 09 Sep 2026 13:10:48 -0400
Subject: [PATCH] btrfs: use u64 for the page indices in
 heuristic_collect_sample()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-btrfs-heuristic-u64-index-v1-1-8606b3c89807@columbia.edu>
X-B4-Tracking: v=1; b=H4sIABeToWoC/yXMwQrCMAyA4VcZORvoRhnUVxEPtk227FAlaWUw9
 u5WPX6H/z/ASIUMrsMBSm8xeZaO8TJAWh9lIZTcDZObZhdcwFiVDVdqKlYlYZs9Ssm0Y8oxBM+
 ZR8/Q+5cSy/573+5/W4sbpfodwnl+ADUmDJF9AAAA
X-Change-ID: 20260909-btrfs-heuristic-u64-index-cdb994fdf14f
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: Qu Wenruo <wqu@suse.com>, linux-btrfs@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788973852; l=1567;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rc6pysinAtxTWfmbt7G11fkKqor3YnttVUGOKHDnERk=;
 b=Z/SSveEx0RWg3+66nrs20K2QIMA0SAKh/FZs6GwHWXnO8lsjr0U83fIjJIglJdv9r9fi4V9fl
 ydmRlI3v6FMD+47h73KbfAjZR1WyaxTPGX44h2g/SaI4o129x7vcFnb
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: GBBFv4Ys4Tb2pAgYtuT5CSbIUmozv0FA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5MSBTYWx0ZWRfX03lUaxZ1d5sX
 83n6q3rJwF/ySOqR1ckXpIRiALjiqS7OUckHwa3jEgv3bHjK2RgQLGwxWNagH/IOUCBqUUoqf09
 LW7l4aSfA7Dj4ci3F2Xm8gU18p0ah7X2W78Ey1zAKXqZFl9myWgD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5MSBTYWx0ZWRfXxheHcd//Nked
 wrPBky/LQ+7CEALJFfqklvD2xb/i2Rk9ZRuhsAmMia65m3XAlRnhnz3mssAb2TFTTce5TtVPB63
 yphlUn8VPjxfYJYTklvo5mPJOPJid2HMPUDx1I+Q7PlOSOIZ6MBB4oqvbPXkkOQR+T/Z7s9I3mb
 wVjgdJSczf5ivCo67Sg9Vi0cSUoVk7gYaMfl9yJ5M6bpOlytKiOLicEVpZ14O1LHvGvlD/jdT/y
 LbHzZ2wfRiwQ0t3KJIRHQor6DJoX9brXEHFdMVZfA+uZiRTcVJoI9VkOMl8A9gNjhsyECKPggmC
 rT4HIRTc3lfVlbNi3keeIdGATuQJq9ngOniDADpW76xSbgM4lVNgEk7Rq54xNeiwIDpF6flmxRo
 EJRXFe6eW8Xk46hGy+8oDGzgzJyeN4fwsh7rUN7x0+amPx4YHJkP7oM8sw10CByP1zAZ/AxmLGO
 ONx/dIV6gZ6huaKV5zg==
X-Proofpoint-GUID: GBBFv4Ys4Tb2pAgYtuT5CSbIUmozv0FA
X-Authority-Analysis: v=2.4 cv=LdUMLDfi c=1 sm=1 tr=0 ts=6aa19325 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fJxgZNdXt3opHMdyAp+FXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=6w9P9XadSiK96p_W-bMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 adultscore=0 lowpriorityscore=10 clxscore=1015 impostorscore=10
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090191

index and index_end are derived from the u64 start and end offsets, and
index is shifted back into a byte offset for offset_in_folio(), which
needs a cast to u64 to be safe on 32-bit. Make them u64 instead so the
cast goes away. They still fit pgoff_t where they are passed to
filemap_get_folio(), as they came from a valid file offset.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/compression.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index 20169d028961..228d1cdd7c29 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -1489,7 +1489,7 @@ static void heuristic_collect_sample(struct inode *inode, u64 start, u64 end,
 				     struct heuristic_ws *ws)
 {
 	struct folio *folio;
-	pgoff_t index, index_end;
+	u64 index, index_end;
 	u32 i, curr_sample_pos;
 	u8 *in_data;
 
@@ -1517,7 +1517,7 @@ static void heuristic_collect_sample(struct inode *inode, u64 start, u64 end,
 		folio = filemap_get_folio(inode->i_mapping, index);
 		ASSERT(!IS_ERR(folio));
 		in_data = kmap_local_folio(folio,
-				offset_in_folio(folio, (u64)index << PAGE_SHIFT));
+				offset_in_folio(folio, index << PAGE_SHIFT));
 		/* Handle case where the start is not aligned to PAGE_SIZE */
 		i = start % PAGE_SIZE;
 		while (i < PAGE_SIZE - SAMPLING_READ_SIZE) {

---
base-commit: 0fa0a3b3b2b007ab40e87245152e1328703a317e
change-id: 20260909-btrfs-heuristic-u64-index-cdb994fdf14f

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

