Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF25650C29B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635368; cv=none; b=FTPb9DTRJGvfRLV0khurJRTZNVFQSQTvHrXUrDmuAxIV0IdKAXFZw+27XUn8MVLAac4welYxZHKt+qZQtwCliEyiP1LyQxbrRhou2LJTtuE+rhHb/sOM+fxKKUt1KrsYODcJa+grxNnkJvNnD8yOGK2I+JH6csIk3NKNMIAos28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635368; c=relaxed/simple;
	bh=Knzv4nLdf0CUhDUXi+3uKsDl+EcnYVChUNre7uBmQOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TleumDFt+OtwUQmlcJbLVMEwd3xPCa+rZoL23u4yE9EMlG45y43jEa+tnGwoZCy/KYWzMi2qWvfAsGYlznmxDIFlE7+06iUX2r7Sgmi54iyh5Q7kPYALswErU7QFQsPVIVBDLGC2oFgP/S3QuabGOhR+uX/EL3gyNw+Su5wNYRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=cU8KeX+C; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=CQZNX7ae; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="cU8KeX+C";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="CQZNX7ae"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685IaeI01098130
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 15:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=yyIKW12sRrjzxO+EKvuTJeau7Q
	h7or2NRAOG3WxPlUE=; b=cU8KeX+CeDIvN534906XHmtkNJ4dKtEhmrGjehb62u
	tuWdywOhD0liFvdq3bhk+HWMXnof8kSBoDHs59mJN1HwiVPLsjkuqJmZ+/XwtcE0
	++C6tlm8opJ3M10klwV/KCJu6JwFgSHm8AtM9EKH+03FnWzrunRiBU+kbtde8Oeh
	kPL/bBcS2yCqDyhLa/OX2Z8EfTYcCs04NZYkKBB5+v1+XQU4v18BoEm2gqx4NGyU
	5UbLXDej5+62/BpNR3fl6twAnA7aVKvgdZg+4pSTN+xy7bmVLiDhsUfkNdeLOx7K
	u7A+DN+jPaKY7KD9MiK82+p2HNaRH5wZp8cCOHD5x/gA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4ggf4xaf5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 15:09:12 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9393ac4961fso214443685a.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788635351; x=1789240151; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yyIKW12sRrjzxO+EKvuTJeau7Qh7or2NRAOG3WxPlUE=;
        b=CQZNX7aeDyQJIuB/9DHBp/0XP2Jn6XWAM/sFZDWzKCiPbWfSNfFr1aZonq6gFcnLAi
         6eXhZsEVoINKEr2HHfBmuFTnM32uMt+pmeCAists0smo5obWkJJcdRM5smAWDsjjADkG
         yEVPrEAozcSjLdbacfR0lGa8lAfkCcuoLQI6lFo0jOxXyXjxtV5+jGsfXavtDDTtBrwI
         vvEC17FxTPfT9d3dQIQ5Ksw+hpI4EYZuEL06Nhmi2zaB595K4YO3jmTAzw4Mw34eaJHV
         4cTxFcF+OizwWSm+yqbzhu0zqSzXiPpFqB7v+2J0f/Dw5QKk1d2Kk9xNNbt1ItivYUZq
         s5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788635351; x=1789240151;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yyIKW12sRrjzxO+EKvuTJeau7Qh7or2NRAOG3WxPlUE=;
        b=oIKNtU3/UQ1K7l5jiWUh2heTuQgO0fVGBmHWHfXt3e/Ym0CO8RZu0AUp+3WLHMqhgi
         azFiRlNGeFol+qaPXx3e0h5C/KuSGwYcalL3oKSDBFdrTiPCKolZUdlsCCOJDQoUWpcU
         8TKMFmi4+6ygSwoUJnyGG5GkdgJGPXizcbzrbNL/w/A1VvXBZGugIU/zB1D3R48X5Z2O
         p26Hhsqi4VtQN8CPZiEMe4H4vPozxfP+PsMjM8l7Vf2d48obdcAf8jzabOZFdRyg7TvV
         T84VMqQqDlPRZ6xCmYiEeGS76e3AaXA1UlBh4fUcyT+3GtA++K8QxkkkUhqASJVe2Lj5
         RiyA==
X-Forwarded-Encrypted: i=1; AKwUvBxcaDfo1R1gGBwFnIihPI3rhKgNflb/CTrlwXJEyy72xVbditQMZ+OH0Ffz5Te78+xU6322cDnsMaxMPik=@vger.kernel.org
X-Gm-Message-State: AFuF++mJdGrDW4oT+1roCfN0TlOcehokKBbg7xC3rN5HOC2DOwEdh2pZ
	4u/MNnIxVutUW3qszvjI+rMj4Z3TEhS2/2n+DtvJ4Zpj2ohKExmfDR45VIMT8hofZ0KBqk/BFIS
	xejmT1DtpfwTz9Ykm7DsjGh73nQYBSRXnn4sTebphGBM/V4atRxW2fqrv5dYZHnpcInI83YI6
X-Gm-Gg: AYBFou0kjJowNxB1xfYARhuMTDaK6KK7oSeaKy08jQFtS6FvGqtz3TBobsRgsvDGYIB
	LOxGKBfl9zmPKvRFojGxWMqZe+K0616TRWazTwzxZVy3EIeAYhabiwoY6uLoVRYvGJoxTBkPqiC
	zqRhR+74zVl0e2bSzmSOlMkJJavDFuztCMx1UBhOobwl89yEsL7a6p26EqEWcJqoVxwp+pAMX4H
	WVgnkQ71Z6Uf9Qbz/GxiJYSi10XL8Ba1S/vRx64sTlGCx6Z/m84M8HFJEeXUt0oU/yN+PGYHvRy
	dYpFSwd1fyMwpMBmU1/55AHTfocGtEGbjmxe9QUA5osjee9Aah3PnEBf/79UJzBJf5wQO7hsyrC
	B3DDWdzbq9/WmCByacTUCMJCX44XMC4cRXcWwiDdwdtC0j08/AA8=
X-Received: by 2002:a05:620a:27c5:b0:936:cd74:4f45 with SMTP id af79cd13be357-93980538f1cmr1288599685a.37.1788635351168;
        Sat, 05 Sep 2026 12:09:11 -0700 (PDT)
X-Received: by 2002:a05:620a:27c5:b0:936:cd74:4f45 with SMTP id af79cd13be357-93980538f1cmr1288595985a.37.1788635350558;
        Sat, 05 Sep 2026 12:09:10 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-57.net.columbia.edu. [128.59.179.57])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9ee9fbsm503659285a.1.2026.09.05.12.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:09:10 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 05 Sep 2026 15:08:30 -0400
Subject: [PATCH] mm: remove PageWriteback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-remove-pagewriteback-v1-1-06f41c00db03@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAK1onGoC/yXMQQ6CMBBG4auQWdukViCpVzEupuUHRyOQKQIJ4
 e5UXX6L9zZKUEGia7GRYpYkQ59xPhUUH9x3MNJkk7Outt6WRvEeZpiROywqEwLHl6l945ircAE
 85XRUtLL+trf73+kTnojT90X7fgC0TKzPeAAAAA==
X-Change-ID: 20260904-remove-pagewriteback-69d2aa5b3ee9
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788635349; l=1311;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Knzv4nLdf0CUhDUXi+3uKsDl+EcnYVChUNre7uBmQOk=;
 b=eSGJ7KvLBuBnBC9GvLvaZ45PuNk7Tw6MDSd+SKqd40OqhXVY2UdADAnpZcwBTqAFfH1PJfje3
 4D+ts/JGrQ4BLGyJvAQoSROOEECXYnmRgGITfyuMI4bvE/bkvMKiI44
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDIxMyBTYWx0ZWRfX8F8ACNanKZvl
 FVowSDfb0KvfNgsD684gRMpvnPt2TxYhiUBdbiZlx/DpNXEIgHymSGSutFcOePFyF78DFSziStI
 cVDgoEBW732hBQXWreh3FNBzXhEQYNwfPZaMrxTWAjKX6Ld0xfC3
X-Authority-Analysis: v=2.4 cv=QMFYgALL c=1 sm=1 tr=0 ts=6a9c68d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qh9WKzuy3vK2roC+qB/eOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=Z08UwzbLghVimfrVTBAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HZ_YDmzydQdKgs4ThBadcdgze2rG8Xty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDIxMyBTYWx0ZWRfXwhLTFITWoekS
 6AJ+Cyk5dSWo2WDbIJcRopJkao6+I3nb/NvL9hwoGaQyzNImsZHKQGtByO+UXdd46SENv5oQ1Qe
 qYVeSpunGATfkAV8V8hKCCqzSgRAHbPL8WbZ90ODVoNY3hsOv0cB48ePPyLAfmgSajo14Ggj3sm
 ZhGfywp+hZddS5aG/gXxXh8O0L35ZAOM69PbAna0HlwMOZznDFlpw4etmEJL8lLTzrYUDoPTRH/
 whsG2e7PEVsKFkQZprDxnQZPtvt054VHlHeyPGMDWT5LiNL22ESpct+f0inxP72w5btzVG0PzV5
 sxuvvXACRf5xGgCKTObXfEHVNsruHa9V6325Uy4FiXvfe6A2ZEVBeOILQI/6wnJCVQKUEBwN9PD
 7kwd8vRlQ7GA4U3C9q6jzzf7f95EBf2j8danSnWYSiBMY73aAijB4OFl83uVUVI/oprryM97oX2
 AIT5B5B55psQYlo2wPg==
X-Proofpoint-ORIG-GUID: HZ_YDmzydQdKgs4ThBadcdgze2rG8Xty
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11897
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=10 lowpriorityscore=10 spamscore=0 adultscore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050213

The last caller of PageWriteback() was removed in commit f75987e543c2
("libceph: remove pinning assertion in ceph_msg_data_iter_next()").
This flag is now only used on folios, so we can remove all the page
accessors. folio_test_clear_writeback() is not used, so don't add
FOLIO_TEST_CLEAR_FLAG() for it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/page-flags.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 3dc79c0c5adf..86dd0470da11 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -588,8 +588,8 @@ FOLIO_FLAG(owner_2, FOLIO_HEAD_PAGE)
  * Only test-and-set exist for PG_writeback.  The unconditional operators are
  * risky: they bypass page accounting.
  */
-TESTPAGEFLAG(Writeback, writeback, PF_NO_TAIL)
-	TESTSCFLAG(Writeback, writeback, PF_NO_TAIL)
+FOLIO_TEST_FLAG(writeback, FOLIO_HEAD_PAGE)
+	FOLIO_TEST_SET_FLAG(writeback, FOLIO_HEAD_PAGE)
 FOLIO_FLAG(mappedtodisk, FOLIO_HEAD_PAGE)
 
 /* PG_readahead is only used for reads; PG_reclaim is only for writes */

---
base-commit: b733fe31e781ed45c56d2ec561dbb61a903693c8
change-id: 20260904-remove-pagewriteback-69d2aa5b3ee9

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

