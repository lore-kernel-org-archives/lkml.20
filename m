Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C79B3EC69D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968280; cv=none; b=YwKEOHQo9b0WBRT6qjT4SU2+K0mn+1WNbFmhLGu7ezH11CDy9MaHwmeyVPszT/I0LyyAAHwxc+eHvwGQzRyAtPi/zHB+Y1GUiKqDWb1EybK3YDQi2uPZ/sTCpoUhrSZmqI817OXJMHH8iWJG1+/elN5CFwlmjEjyo4HjVsXeNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968280; c=relaxed/simple;
	bh=WF6+y8M1H87RN89tbxSCX46b7bs0+K3hXAxym6HzJ4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JofZgMSh1zKQxZf/qFV2e6mnO+0vqAekphqJDcJmlOg765sYR75/VQ1g2sT5ZDlzjVszRLf9kTYWKpT8CQL7cr0PTCY1At0N/U+zIxk0+t1jilpOchIQMUPsov09XCGCcdS+9n1a6RUZGOKO74TIXj54EZElxuFkLWFg0E47VgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brqvbZWX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUZMgQTg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brqvbZWX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUZMgQTg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692HYIwA2174814
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 19:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ucaMuJoTpFK+IiMHoGwV2a/H7vZce9en2rw5/IvbLME=; b=brqvbZWXTDC4JTZy
	gMAkvqMCcyxckvBTqGVWw8NXMzKjQwc4PI3UjA+S3n5zzJH82j2P5mKt6Z2LpWRx
	o/vG0+zFECT5W+Z6J04+4xJctOws+bd/n8dXI/OCk6pcf+eVTnXab8Yka0gYKTmV
	P0HD2s9LsiJln5sz6iKIO1Lzvsb+oUGUKKizM4pvGhWMLkFW5ocsfrASLOGRsfm9
	3JEP2uoFIyxV2XvDrOZ0dE/dueWJlzt9S43u8diMytGruh0kz03NT9x0bLLxvRgh
	yKRAddF2t8/xA/jKopJmWgzSKAyukbePdV2cRcbNe+4f4kx5e2Kl8+yJg/9m3GEq
	uUu2Nw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2h4krctm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:11:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so11046617eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790968271; x=1791573071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucaMuJoTpFK+IiMHoGwV2a/H7vZce9en2rw5/IvbLME=;
        b=FUZMgQTglL+ny9+t3Z5i3wywn/7VOizY1OE3BF6wPu0IKYIya2kX8u6j5tjAoVm+gM
         bV5ByauoH4DmtEoGXADgdoMNY7mYk7M9SBrvEHJwizHkVvAinaZh3bVR4GOsxjHILWx5
         lgwhyBsUpSZ0xW7cgblj60ZJM9rRuPGMKXHQ+JlIozw/kidng7VzoIg7+JM9g9ZB/QIY
         kyw/W47S2nNfK9vdWmvdgmv44zWc+rvfqSrzSPjixFX/s0cH7QjKTOG14B2bty0rgeW4
         qLT3GZNUZrXsgvka3NT7sGeraLdShTwgZJBghumDFjlzkmMMSbopNdSvAaVygwHkhzG5
         p/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968271; x=1791573071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucaMuJoTpFK+IiMHoGwV2a/H7vZce9en2rw5/IvbLME=;
        b=vtGktFi3Hue8TXy2v25b5oIlg0uv3C13ZFrRfnhMTErI5znn9qbKQCbJ7WlY2rNyeK
         RIbTQzkBPgNtTkaWSpF28E6bSnLZbOErxQ0VGrZvUiIuQZSVudG1mURztseatgUzLIm+
         XsGidgLYMIKbLJr5beGSm//6yLA6C1KJNt6P3VjBBZQDEhMazBgy2ImmljiupkuVoUDt
         Q4s8cNwWC6D5P5gvBc0qO6dFeZ7ycUb3x2K+hQryuA6fqizQ270im6VUzF2TkU2B2t/F
         DviXasVceFJT06UpGZd52a0G2x4qJ2iiE7iI1vrc5lae/pRaXIjxQs2eHbmRJS9BO1HI
         HVeQ==
X-Forwarded-Encrypted: i=1; AKwUvBybrohdSWVYvhbIg9zulsgJRk029vQtpRZw/XWDHbmWjgCPAJR1pR8myRapssORO66lhD9uYetR9ncfX3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhZ1xGQZKKs/EkjrHAd7h12FXNZmU60vROFAjvfiD/DNDvJRKp
	iPKqZ+QyxmDEGScHDyYeNqRT9/7OXoGF+q6gsOucKEQZNUtSaDxdHT9K09d/jvdibvAGJLQdW6z
	14t+ld684Bvn35pi4ycxFpuVkb3hWfobF6fBtLrYlJ0pcR2Yq3ehATO/6h6Y1A0vkub8=
X-Gm-Gg: AYBFou3PDTpsNTyqqkgE4sr6QMEwq2DgFTfnk94Nvi8LFA6cdHriFqU7YWnZwj0fmF9
	moJ8jhJk7LOuKpTi7K7TXEOumscW8OVbOP2f8Ju3hAc60is3lAZsug8a7n3Al/8bNvqKraEsvcc
	/vqJXjkg/tgQBWXR92rARbcR8s2aq39oKbGgzjJQ1twG5jEn7uqbyk4WXqJRHcjEBPOJdpbbKjO
	M6lLasYpvaa4wuAPDjQvDIaCH0pDKborY/1FKKr2p3/sM0sQILfxP2YU8aZWvvyNefwPZEa0gRg
	1Fb6eoSmdd8xPeAK67SOgz8ymhR7VL88H4+SdBzxxjbMt8eYvL+ztVXfzcX6wSSZOGrs+AYjbCa
	GhEfAOkgS8v5gZP/cBhseeqnxokHCBe6oH0MriAq0EhiiD7Jr8Bz9LlQ=
X-Received: by 2002:a05:693c:83c3:20b0:33b:f5b7:f494 with SMTP id 5a478bee46e88-34f1509e567mr4432620eec.13.1790968270830;
        Fri, 02 Oct 2026 12:11:10 -0700 (PDT)
X-Received: by 2002:a05:693c:83c3:20b0:33b:f5b7:f494 with SMTP id 5a478bee46e88-34f1509e567mr4432590eec.13.1790968270237;
        Fri, 02 Oct 2026 12:11:10 -0700 (PDT)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35105dd1dfasm5263296eec.8.2026.10.02.12.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:11:09 -0700 (PDT)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 12:10:56 -0700
Subject: [PATCH wireless-next 1/2] Revert "wifi: mac80211: do not use old
 MBSSID elements"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-csa_cca_fix-v1-1-b83a998aeb44@oss.qualcomm.com>
References: <20261002-csa_cca_fix-v1-0-b83a998aeb44@oss.qualcomm.com>
In-Reply-To: <20261002-csa_cca_fix-v1-0-b83a998aeb44@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=G46JgNk5 c=1 sm=1 tr=0 ts=6ac001cf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N6xB3pvji6ksF1bIA8MA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: UqXajeTe7AR1AR481WA9j4fzG0fRFf5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfX9IxB/lPtwUjV
 XSYo230ZUVnjmXkQaaV3hMfF0ZBdqXFhA6JsgSl0yFhS1z3KhuOZuuWA6S99Nk+qmZMdO2cfzNV
 aYQjp45L1sXwFUgo9wj4l6XxbRlixTI6LRFwud5P/o50bgQKmaVu+6Q/Y/5OAhv19Rp8+MJHamm
 RhJAxOa1QkRb7lykhbxoCMNCM/FG+waxYS8IU217qvTD+AkL5AoO/W5hK2SWXb73vw1pQjWdgPF
 +sTwZztmOLHCRjM3qgfrjqunm0/XmmoQX8NiKca2+TErPJt4v4puX2qnhnb+TKLZlPL3KKhVUer
 otVaIHOs5quf6K9XvNP5ppmNu4G8GHUs+2JwxD5uhyGwuE2GMh1hZRPzmEO3ETZ0GmZvV4HBrff
 d+5ZkSX1a+HMdW8uJSpF+U4FZuCnzMJNuKjOwaaPbOuhCMurePiI2qb0TbvjFyPtXQUhK5n5esv
 qRT0Mgf7Dr9A+srHqlw==
X-Proofpoint-GUID: UqXajeTe7AR1AR481WA9j4fzG0fRFf5a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfX9mjf7mrBRPFv
 kz4TybyyppnvFJLUbfC96kHCKH9vEY5WHn6VH/Axw/7UJM57WMi6B9QQjRHLgmBC56JKTTS45qi
 pSG87kNb7j7fB8KRbDCgZgJkRLO5WgM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020076

Commit a519be2f5d95 ("wifi: mac80211: do not use old MBSSID
elements") fixed the incorrect inclusion of stopped/removed
non-transmitted profiles from the Beacon frames, but it caused
a regression for channel switch (CSA) and BSS color change (CCA)
operations initiated from hostapd.

Hostapd passes two Beacon templates to kernel for CSA and CCA -
(1) beacon_csa/beacon_color_change used during the countdown.
(2) beacon_after/beacon_next used after the countdown completes.
Hostapd relies on the kernel to include the old MBSSID elements
while sending beacon_csa/beacon_color_change templates to the
driver.

This path is now broken and results in CSA/CCA failure.

Including existing MBSSID elements explicitly makes the netlink
buffer larger than default 4 KB depending on the number of APs
which would need unnecessary complication to pre-calculate the
buffer length.

Revert the commit to fix the regression.

Regarding the original issue fixed by the reverted commit -
Hostapd now has a new commit which always includes at least one
MBSSID element when the feature is enabled, hence when all
non-transmitted profiles are removed, this empty element ensures
that stopped profiles are not advertised.

Fixes: a519be2f5d95 ("wifi: mac80211: do not use old MBSSID elements")
Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 net/mac80211/cfg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index bd1a857c812d..b38941e6784f 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1518,6 +1518,7 @@ ieee80211_assign_beacon(struct ieee80211_sub_if_data *sdata,
 
 	size = sizeof(*new) + new_head_len + new_tail_len;
 
+	/* new or old multiple BSSID elements? */
 	if (params->mbssid_ies) {
 		mbssid = params->mbssid_ies;
 		size += struct_size(new->mbssid_ies, elem, mbssid->cnt);
@@ -1527,6 +1528,15 @@ ieee80211_assign_beacon(struct ieee80211_sub_if_data *sdata,
 		}
 		size += ieee80211_get_mbssid_beacon_len(mbssid, rnr,
 							mbssid->cnt);
+	} else if (old && old->mbssid_ies) {
+		mbssid = old->mbssid_ies;
+		size += struct_size(new->mbssid_ies, elem, mbssid->cnt);
+		if (old && old->rnr_ies) {
+			rnr = old->rnr_ies;
+			size += struct_size(new->rnr_ies, elem, rnr->cnt);
+		}
+		size += ieee80211_get_mbssid_beacon_len(mbssid, rnr,
+							mbssid->cnt);
 	}
 
 	new = kzalloc(size, GFP_KERNEL);

-- 
2.34.1

