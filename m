Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2D439A4D6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291513; cv=none; b=mZMEtX60397jgVO3xpzzuQ/h4QT3muSfLRgwO4ZXjpamlQHKGDGSskHcetM/iJZdHR14vZAlo6U+d6luDa2IRTUmNm9aWk/vlXJRbG/ApAFpcbIC0Rw70/LcEATnRVqMwJovnlrJkxJmNOeUpsQsdN8wZn3rADrEsqdokeDFCdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291513; c=relaxed/simple;
	bh=W4O6XEpMwynUwwXj0xfp3EfT0BoZb0GOfBjR+1fixXU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GA/VIUXwrpKBeYaxEq8aVHddo+yeYLFFw/0B62YSk7SuvJlZLhrvCNcjPTErYYIdsDVo+43yg80GoUobMj4EDJ0ycN3dYj7UtJKkJTL8N7clfJlwzQyc4fTh0PIG4eGy9hVhCu+5NX7fsoQbmdGdPNGEgQ537UvxL27qUd6pOrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=s+mViLE1; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=iv2tmbeU; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="s+mViLE1";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="iv2tmbeU"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681IgeDw1695423
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=abeEyCGVZG04iLojvXDSZUvpim
	uQC1N2Upc36tnQnyc=; b=s+mViLE1cujMA8/hsGitHgYeC/jVd3AWLgTZi8knVd
	P6qphQ2ZoAUAH7cLvNJdgky5AU+H15hLR0C4UU+a9jtWZrok62YEaGxRb+TSvKvD
	jIdFJfwrB0Iwlhu4bJEV3rDrWTX1/+c8wJ/p7YXepCcRo7KwBvYpdtpDzKNlipRJ
	0vglwqTWAmqcCPNeWR5FeugeVUttPqckxJAquEtRfeP8zsAiFE/l+QGKw7ZcLX3f
	Edp1bKdEtyqpKwTfU8S7VwleWbqWOwI7gxehikadj0lQF9YMHsOEUG/EioID5nLw
	mTUDKFx09T0Cj5b7jfiooZNiaLxmj6s9fwcmhsbrJLNQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4ge0p92rqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:38:25 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e87478402so7656486d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788291504; x=1788896304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=abeEyCGVZG04iLojvXDSZUvpimuQC1N2Upc36tnQnyc=;
        b=iv2tmbeUpPsYLIK6Ojd4UxGQBiDwlhV14E06WKByplqqSzihivVcKdzJ406eG3n6ii
         /P132qt8wJiDbN9qDWf9RErjzccf4xAT5rm5R2lETRzA4QX/fK1J1rWnVD5IFDUQC4AK
         aa9Y0rpjMmnPtCHiUUsQukI/CQLgf8kWysA4upaZQn9Bk2xzWIShht3R7i5A6ilrVADv
         JwoJZaSIIRXzZS5ZKleFy0uxnTFDM9J+grcsVP1HkiJvW+fsZxEpG7BGLBQeQUZGhB0e
         UAo/BvzukNCG/siUeHt4Vdkbb0YG9NiSJGisup+QBQ8BaGCA8zx4h0e3NHdlKFLTxQ7A
         MQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291504; x=1788896304;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=abeEyCGVZG04iLojvXDSZUvpimuQC1N2Upc36tnQnyc=;
        b=fFkTxsNVYuWz0Z0YbyqDXjSUWs/ox2Y2FJJTQkuHN4BulWdMloBznb/Gc0xwUYTb0I
         rnW/zW7slrudWbTw1hkqr7A5CcDVC7XzryZStalAbMVVLbfUc/k++P4uY2dnjJ4DKt9D
         dDoKq5JsldeR37ArPPwsIcKAjDZmwuTtGYovVG4u7ra8p3vIuJN4S9FdclSpZSnArIxK
         fOjkeSAzp0j4lYTQofMMYgfRUEItNyktkiWpF8KRZLJQ+4m6eA90fmxC1tfaOIniRZ7v
         6XoLZb7PS+0B7T2+wm3BWZi/QhmvdZwiQujQCnhtoEBc7OPgXG29BDIf/FMkc6yp5tvc
         +Nsg==
X-Forwarded-Encrypted: i=1; AHgh+RpYhupE5JUA4PME/aZMR0Bq4YOEF/jMmmqHAxgDMaYIqDfr72YfcEf8eg5nUnVN5DqJktA0H4OTrxPksQg=@vger.kernel.org
X-Gm-Message-State: AFuF++ndfVvqG1g4zgXceQUD8R+Cm2uvi7mAoYOPv1FAHLBnSFiCPiy5
	CmUkUcVCAXRNgE8sNoiD3KWwSPs2yRPEVhMGuFsdjxzQ5ClNt+gDdinRpfZcTZK1BD1HivPTWdd
	7mqVVU+k5fQjwkaOEvzHfyVkvLdBe+zn5kdJtbv3qzdSAAUAWzcjl5atjGcCe6A==
X-Gm-Gg: AYBFou1Nasze/yGayzf3ba0Kk5l0A6ZWFDrmzhX0WjMHcYX1kxKnqopdA7Xgpahb1lZ
	+VgXKkHZMXOC6jGaQJqstdMlcbPeB43mkYaZKi5hBByKaW+UEBIT1qgGZO3wOKpDFS1/CnbcCim
	leJshvWBHuvrdMkJnKeyzlIXLYuZRwds9kHWq9s9pfvbli7rdRBlswYKIXd10T0m569FrErTZgY
	zpVTiCFL+T8Tc+puLqY0bLHSI3cFSnQ+HQyQT3bRarS0OPAPoibc4DxIE6NcQ/A7xgTCBIQ0TFd
	U4NyEyrs6bdt9SZc+/EFvsC0y88BfA6DPhtj7R0tXAxHIB5dYrHWn3ptTo4TIspJQaJ3aT9IUFq
	eOC3eq4bz9nGhy07oj+YvsyBXIxm/5/gubAUnkXzmzZK2a2kUQT4OZQ==
X-Received: by 2002:a05:6214:4197:b0:90c:d4d1:aaf with SMTP id 6a1803df08f44-90eca38c54amr253336d6.20.1788291499315;
        Tue, 01 Sep 2026 12:38:19 -0700 (PDT)
X-Received: by 2002:a05:6214:4197:b0:90c:d4d1:aaf with SMTP id 6a1803df08f44-90eca38c54amr252726d6.20.1788291498789;
        Tue, 01 Sep 2026 12:38:18 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-192.net.columbia.edu. [128.59.177.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eee72f8sm1201866d6.36.2026.09.01.12.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:38:18 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/2] mm: remove three unused helpers from mm.h
Date: Tue, 01 Sep 2026 15:38:03 -0400
Message-Id: <20260901-mm-remove-unused-helpers-v2-0-f6474e169c23@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJspl2oC/42NQQ6CMBBFr0K6dsxQsIIr72FYQDtIDW1JSxsN4
 e4CXsDlS95/f2GBvKbAbtnCPCUdtLMb8FPG5NDaJ4FWGzOOXGCNORgDnoxLBNHGQAoGGifyAYo
 CLwLLuhKlZNt88tTr95F+ND8OsXuRnPfebgw6zM5/ju+U794fNykHhB5rrrAS/VXJu3RjNJ1uz
 6Qia9Z1/QKJ6SS01QAAAA==
X-Change-ID: 20260901-mm-remove-unused-helpers-33056049864c
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788291497; l=821;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=W4O6XEpMwynUwwXj0xfp3EfT0BoZb0GOfBjR+1fixXU=;
 b=cc1Kbk3+fvxtQyPl7Ad+uVIO1DINWfdCFEs308JrvB39pcwBWnHEaGiY4trGL7kL0GXRt6W3P
 HEYT6ztXGrkAEI1h3slb8NH5VekdmtkYHBlJK7fkvtCb/VdokMI6bcv
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: f-ui14t7dbhzAGHeSm1TfMdZ-hdPcgBo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE3MiBTYWx0ZWRfX+hwBHFUTyfD/
 cANTHZPR+0E5dEk7fQi3euEnOvfp4o06VBe1IyR42KF1swZnNUqmI6H8vklQT1ngFii+qKxT9lo
 C+EY6hrHIU6ipbrUofUWcS1Ny+XNdDZEAyqRLKVjw/gvbDcQxOnB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE3MiBTYWx0ZWRfXwC3u42nyR6+D
 HcqbFQWbeC1oDKwdxwMspJV3IHmyNk8iy3zt+mmOB6THLsFOHeXJyW0PkM3cfguXtNRTHJPdr98
 v8wz2v5N8/GB1ygwSYni0l974kP79P7xDbdQTW8zydfPpFrHFdse66SZueIgG67tSmEK6mY0yBk
 SaSRwTcYcriXjGO6Z+t8wwMNUewh6iFkXVtw60nMlNAfAVmFlc6cPl0tiECL3dhH+4kRB/ulQyA
 hWm49kSjAPJJROGF5Zlf1k5dDbICjLF+chwSTdcc9SMZhJi/EJC5Lp1/6veLfFjp+RdQ2T75BqM
 1lExMadDE+pZzOzaailoiiZvLwS9GURME/7wBiefSdJfD/Xp8+kuGGUEa/j9kTGgtW+GORqt1YH
 nJ8SgxGbl2v2sU/2i+1HZBbPdlNMhkwzMz8Urk9GZlnUPSNDlDvAj2vNgJOrc0gTDtqV6loVsAb
 3xGxMrpx8GILjhWoIQg==
X-Proofpoint-ORIG-GUID: f-ui14t7dbhzAGHeSm1TfMdZ-hdPcgBo
X-Authority-Analysis: v=2.4 cv=Z8Hc2nRA c=1 sm=1 tr=0 ts=6a9729b1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=l2kTeM/jHJEfm+IcnTWp2g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=bC-a23v3AAAA:8 a=rF-OBKQuQRgILe8AnB4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11893
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=10 bulkscore=10 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010172

I happened to notice these were unused. Two of them are relatively
recently unused, and one has been unused for a few years. Remove them.

---
Changes in v2:
- Apply tags (thanks Lorenzo & Mike!)
- Drop totalram_pages_inc() tools/include/linux/mm.h too, per Lorenzo.
- Link to v1: https://patch.msgid.link/20260901-mm-remove-unused-helpers-v1-0-f092d086f7dc@columbia.edu

---
Tal Zussman (2):
      mm: remove unused mark_page_reserved()
      mm: remove unused totalram_pages_inc() and totalram_pages_dec()

 include/linux/mm.h       | 16 ----------------
 tools/include/linux/mm.h |  4 ----
 2 files changed, 20 deletions(-)
---
base-commit: ead700ca770c82167af32622cf8b68c9f87c3c7c
change-id: 20260901-mm-remove-unused-helpers-33056049864c

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

