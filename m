Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5FD3655C2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267570; cv=none; b=m7UX/jHbAvxz6/lRfXsdn84oqvZQFuvZ8a11hSOoQEhUqiigcQqyNDcRp/SWXg5CykrSaXMNKIz3CmbDlwPNi0QxQikmO6kNNVdUAmyLaAeNd9MshgP7iDh5lQ4XIVvOqFdVVj5xtc7S0P6CzSQ6/0vWNS1ugjfqxEeOMVjZMzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267570; c=relaxed/simple;
	bh=Pqs+cj4xtjDFOIqE9jaFWHBHduMHrWgBCyN13kFuM8c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QnDzlkJP2LcvRFY40ESJj171Qk4BAfzF8Ey4hV8pPZSu86ZqO+glcNudrqJMWKA2Og8xc6EKFt/oGNGcJ2tbEbUbpx4ifK3DKZAAcBZu2O6FM4d5Aybw4YIhaftJ5W9tvbnYgMffSXM8oAbHVFj3v56vg4CKRdg2IG7ufeD3ggM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=nMH+HSqp; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=gF8yg+jQ; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="nMH+HSqp";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="gF8yg+jQ"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681CXrAP1569749
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=I6x0aIMNF/APTHzjlwyItONqvh
	P3bzfUtmEMlPeRvu8=; b=nMH+HSqpCeYAtqsXegpahaw1UyYQ5PPrVfwfv6K+CU
	EPBG2oxk2GjHpC1pFe5oXbRxkFElbmNZhTKAlv565KApyjOP4qjUY+9PWQLtAzxu
	hYsmV4cfw3NZ36qHC+BwZEkouDexjEfMgNxM8BJjdmP6bU59rbRVcVQ2ZmHfZIF6
	VRviuq/8IrdHJZuB+yYKYFXSp5XYulfXfw1N/GBJFtl22ahedbMkAdeu4M4oJRbj
	oMoKQOcEodOB5+JmkNgeNyqIdC73CaGKHRceqiJC2lWyo7KHgbNG9KVtpaoBt3vV
	4m65hP/AHH2MUt1MePHgnIH3YXqQ+i9qfDMV2qLx9TqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gdhfhc043-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:59:27 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so17552471cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788267567; x=1788872367; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I6x0aIMNF/APTHzjlwyItONqvhP3bzfUtmEMlPeRvu8=;
        b=gF8yg+jQH3X8M4Szf6NJHJyrq3saMyDMnjbhCr07Dk48FYwagAK1mA0QeCZFgCYRSF
         2RUV+l3dDv2KFoq3I96zkmp1tScc5GR1WHW8V5xGActg3iQt+/vGBWxibr3HI2va1z3L
         XzoTis3vhf+t7a6F6a2xu1hlHWKSDcFwwcA4xZT/RqQcSrAxQ2PDrhAz34CgOQP8YLuF
         4lnFmAn/Ls9piLLZnfW7TUe6EC5VRW54Bvqa+Xfww8O9RBb8BZGw1Xwsw2w/IZPcqJ7M
         OXCKUwDb93xSDvNr3wknvK7kKC+DOs5LyZFgBtLaASR+MwHAo6kLC2D7buwq+naBoqH0
         Taiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267567; x=1788872367;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I6x0aIMNF/APTHzjlwyItONqvhP3bzfUtmEMlPeRvu8=;
        b=JN0zI3VBkmAtDjMMAOKjEzqJgbq0798Mbq2c4udf6g5v8KCJVE18h2CztySzwn1UsR
         HPOxnEkMVYZbtMnjSwRipdgnYKowBnEJHyaUasLFKv5LnjlviLsasUxAzIrrobuRjmQR
         2UTp3d6R4lYT3ExBFr8EYIkNPFE45Bc9AnqRHwcAURUhIziFOvBQ2BPswo5Y9ye7lzGH
         lZQJVtGid/yE/YqgDvx/NLKsut88CiK6qz8TQzeL3HFFklVitbVqMpKIsi9seJ9zkPeq
         HjY5o5cQoTz8HGZKuXLk6Z179nnOQJC7oFUlU28gxnsFVLjeiOwgQt7dpNxmgVJQbJwu
         uZ/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrFOo25QWX0Z1m+lOnSWurkB0KA5AMl8Qznlqa4V+2dKY78r+7utSZtifTtzv578mkGhDxJqBKXudx/aw0=@vger.kernel.org
X-Gm-Message-State: AFuF++kmbRH5aBRqC5cnLysLVesFfeqEb4qW8k3VnlS61cqrr57Uueh2
	pIP5Y8pyzzMfOjk+Iy4whKsfDpL5rs5wyLlKM65xw7xtzhii92g71IxqNH/OLRz6PpSwaO0uVCL
	zUWnDAL2ixFpMJJeLvp4gGdiYj4e4MSSjNEKHAX6AlCWQpNaOHKBgNo93PwDCpa5FAz9C4byPBV
	I=
X-Gm-Gg: AR+sD11YwteM7K+8BQq8rLvtyTyHOJszhRAtZdcRfUvtxALAoqaBCoQLDpbZh8+EsYq
	xSYJ6z/pi1BUfcWwdbw5UYP5VTOjJhjkeryaIHHXhNlonYc8e6UUKBpxmJGjtLevjQ2NFS97W9V
	jBY9gy4XSxKX6dkAH9FIMhvjJtx77vURQX0BgAxH6DGkfigV60ddPLAoZdPe+hWbhPljO00ilbo
	jez+OAyQh2HQfh/laIC3FsaM/JYgW8AXVnTZIgG/AwQ1mFAqahr6c9AMo11BctzQ8UJnLyhlvNc
	lYfc5Xx1rQt5U28C8JgdVzaWRTXygkY9O7TBRoa89tBwta+nqpbD8ukqZdOwESwvxzudBk0bfyX
	m/naN5KiYr0UE3Aj3ZxYUeiFsqOdv7W8HblLaaOs2GaE9pBfQXvg=
X-Received: by 2002:a05:622a:1f93:b0:51c:ca9:7cdf with SMTP id d75a77b69052e-5302521fdc3mr73571261cf.2.1788267567218;
        Tue, 01 Sep 2026 05:59:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1f93:b0:51c:ca9:7cdf with SMTP id d75a77b69052e-5302521fdc3mr73570571cf.2.1788267566713;
        Tue, 01 Sep 2026 05:59:26 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe830222sm96194331cf.20.2026.09.01.05.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:59:26 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] mm: remove three unused helpers from mm.h
Date: Tue, 01 Sep 2026 08:59:18 -0400
Message-Id: <20260901-mm-remove-unused-helpers-v1-0-f092d086f7dc@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbMlmoC/yXMywrCMBBG4Vcps3YgvRisryIuNP21IyYtM6YIp
 e9u1OW3OGclgwqMjtVKikVMplRQ7yoK4yXdwTIUU+Ma73pXc4ysiNMCzikbBh7xnKHGbev23nX
 9wXeBSj4rbvL+rU/nvy1fHwiv74+27QP+ni7OfAAAAA==
X-Change-ID: 20260901-mm-remove-unused-helpers-33056049864c
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788267565; l=538;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Pqs+cj4xtjDFOIqE9jaFWHBHduMHrWgBCyN13kFuM8c=;
 b=v7OUuFlykjFon2/xI0TirQn4FrxC2L8ziRFt3kNCOKCLO+H51gFCuWnVas7TMNJm3W5x4b7VR
 6a4tCgXPVjXA2C/2OtBT7aNyBjd542zmpQsV2O2Bwy5KkSnkbbaIiNk
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNSBTYWx0ZWRfX2g+8sQelLGSc
 15hbuqXfVkbk4E2iVOq07YIWhyV0Cmjt5aQ0r/64z7L3E2cAE8T5sViYNmZZD0iVTsTycwMXyBZ
 P4HSi1LnKPrlPhBeNbCfZmOlOtWTHd16vL3bDr6DgY9t+LD9kFVK5KMgUkhwWFDBrn46e0TiWQw
 3LHNPzqzw1Vq5jYAavEZNaAXVieqEp0KqRjblRwrE32mSZclBSRDfJ9+E2+zsZa0GKSeztSE9mM
 xglANjLfdo5GWSHmlsGmxE+WNqlZRIPU7I2RfWCnreW2dgkA8TcibM0B4Mya/HHF6R5XLlWyK0c
 LMxZ99ieUiJDAQIX0JbQ9zuFzO3DVoCVGnhDEVEfWVQC2aSC2xhiZey0X7oSDV/A0NaaGJcge5u
 hRPrzC5jxPd0I3n4s6ZeZ0g2sR0LSlr1rzKv0ZjqTchjYHYXrP9o3NdLEmXn9JpD+FRVIjvVIYf
 PfQXE6gMWlVdJ13IM6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNSBTYWx0ZWRfX1HOepaMZcdWM
 8hejtA97YWL4dZlatn9xhYlUI8RJhfLaRHmKpWO/DVDSgkPI6qOJXkhbB53u/RDzacniEYf3iiC
 rfoNT9xHt65GK62/MBw8ynBTMv7K7Mb91+6oD1iFpODKcwaTYSDr
X-Proofpoint-GUID: 007SN63ZoN19N1Sc2nBgb01M4qUhtocJ
X-Proofpoint-ORIG-GUID: 007SN63ZoN19N1Sc2nBgb01M4qUhtocJ
X-Authority-Analysis: v=2.4 cv=Y8DIdBeN c=1 sm=1 tr=0 ts=6a96cc2f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=rF-OBKQuQRgILe8AnB4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11892
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=10 priorityscore=1501 clxscore=1015 bulkscore=10
 suspectscore=0 spamscore=0 lowpriorityscore=10 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010115

I happened to notice these were unused. Two of them are relatively
recently unused, and one has been unused for a few years. Remove them.

---
Tal Zussman (2):
      mm: remove unused mark_page_reserved()
      mm: remove unused totalram_pages_inc() and totalram_pages_dec()

 include/linux/mm.h | 16 ----------------
 1 file changed, 16 deletions(-)
---
base-commit: ead700ca770c82167af32622cf8b68c9f87c3c7c
change-id: 20260901-mm-remove-unused-helpers-33056049864c

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

