Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859466;
	b=QdZ8zjUwDhyJQ3JkKkA1z++0QXJVg0s1YmDQiQdvvt98M/HIQw+CtxC3d4racxyBK7Fl
	 OhFmC7aV7lgGnSzSNkjS+Lum8LObFJKFhfvQrnam0NRD2LnPDOVZT3RL9/CFnMReY3t3E
	 wx+1cq/2Aq2AKpmuveFNhBGSIpPEntVF7+9IOmZVGdR78IV30gGzXk/z6u1SLY5DEm3k7
	 wiMq0Qt6s60lOXfCpulLBJTIkhPsLIDIEDNyObk0LInmEremSnA+hp5Zauz9skbRz8pq1
	 vF6wQM9p0FsrMfoN+ygKVpVkiPHqCum99nAZhuzKxjwIXChp9aQrNIamN7JTfQMttpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x1GSlTdxCDOcwaCkl039quhS7jO/y0dxq7PSFe5uI1Y=;
	b=0nXV3AdgmWRfHVRflq7rnWAqIbobfZ0elHoyzI6VYAsGQI4Q0INdXaPtSeagzw8viagy
	 WB7s6aTx7441qWrReZXU/S9A6QBHM5TV5HkRm1MjH7uUO5ezLzTcUNwEYbuUxkNEGdxhb
	 nkEYMTHYL9sBgBbCkccVktqJXDXoGwEtR7a5rx/eOeli7AGQEkjzL19dd+giPVR9SWI/c
	 wbWee/WiXRiwG9wKP7xSAowmztxTexaESckncbTTn4jTr1q95EByGdI/uTZkU+GNwRLhQ
	 RdrGPpaStgMVpErNBnzm7prWpbpQGnGDZfzxejJBc0xkVh+iaHsUlSrTP0gK/XVwcMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=IpXx2n9+;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=A+bNrbpW;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901FC606A8BA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901FC606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=IpXx2n9+;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=A+bNrbpW
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJXLR73631476
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=x1GSlTdxCDOcwaCkl039quhS7j
	O/y0dxq7PSFe5uI1Y=; b=IpXx2n9+RamcocPRGOPd8XPboIKjiztrAkZU6DcuMR
	owrO1L9jYZPfd7Bix1u2o6xBqkvtiLeQSkquPaLF4IvEnS52FWTuHflsrx6FB9/p
	/B9pEuUxFFNQmGfo8VUZUjGlIsXMKi7dBRHWAdp+W2JfP1C5b+6ic5mq0PCMhvqr
	4E+5fohvAFveb7oCnY0baP2Zj2hHvARpdMapPW47/6QRXbCKyU17S9hVOf1jPaKE
	Eb+KHBWE58OnqIkTxmTlfbP/A9yuNf0uG0wB1tQUjv5iZi7SlNyV3zJ6lB6lyAJB
	NDxqTJoECbwU0nuSRrbFAXkldL6eVYJIxY8e7Knd+nDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059at5jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:24 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso35914985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794859464; x=1795464264; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x1GSlTdxCDOcwaCkl039quhS7jO/y0dxq7PSFe5uI1Y=;
        b=A+bNrbpW/Fh/gjzb0bd2i2ukXiJAFhZ6ks2jB92oz2DwKv4ih3bs1ShddyT+m6wIHN
         5dEfQUU0zPiAP7BxtNH7/2N2ErGbGqK15gDmuhpKlrJPp2ZRutfQ0NHNVyreQ5qEPWk9
         NQho0fIb46L8bbCaoRcyhuFs8wBFz9mIU+X4oN7yqXx9Oru278J5gj4LpS2lbGKmzJ36
         VWbEbrN5Tyr/H6DzGHjTAeB699Y1ydILMP4rHmwobJPXwbLSCbXVqAYnT/rs54GmDq4t
         FWDgYtiTR823eRiK2EweXc8w8PG7RKnxcy+s1BVEeqdBVoQDEEWRXE7BZclHrxcU0lZn
         efJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859464; x=1795464264;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x1GSlTdxCDOcwaCkl039quhS7jO/y0dxq7PSFe5uI1Y=;
        b=eVHQ+bJ7pzXJw858OCsMAWh6iQSDbG0mg/P8aT2Iil0n5hB6u7S+Ifw7KfPKxsT9MD
         BZrldfVzteHjWxqq6neYZlMg0BngoaRBqVHk9PTZKuaQOFwWZ8aD1HjSCFwYnCac9apR
         k+TARWlUfP1YcY6+/JFvQMoLovShW0mrabpIMrDvQqmltjxWwZnXtNoi6E0qbedOCiJe
         taKQj+LgpdoqMJk8tpqUBdcyRy7m4LinBRUD8QckPSzFCmS1xOZuVMhoMIKZ6txWGwTh
         zUE0pbWWmPfuN9fKEiH6wsGDdMW58yObn6aoVC6un/qClVeSs2szVSsbHwoDKcnEa/lB
         avig==
X-Forwarded-Encrypted: i=1; AL+hErExVBv/dKMXrXbxezHWeFGrWXJgQVUe2raNbXW2+VufmvZzN2994Yo4W2HXPb5B8bmnjjyO0o+O9fS3Aq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z95jak+DuoQIIfYEyEorSwFqVlm6xvJnWouOKiaUmLbxZbZkKWZ
	C7MUatLkXCim1a44tnaJTaeuEEngxMT0MRVV1oCFVlprsqjhSMAChC65yN7j0EtYQNoIb53H1ul
	lP0I7cvil2G3DR+TGm38GZ9IA0Aauzxk4ucAmOmAHm5YoGSapR40Uz+EFlKT1pg==
X-Gm-Gg: AYBFou2vbLj/kpvo+1qyy1nyIDvuA8zkXfECYE3JEpWQTR8xQIKXPnkqHuhCq9Sq+QQ
	PTLEtT1KOfwXVDKBflux2Q4Y/vpCtUQC329kmJ9nEfqDGrSrhxC2VR1u4jfm3AINughAFmBqxqQ
	ww11fIwkFpUYvzH80LxsJqiO9nubNnOTcHOCC3a4NNnsM+SinOe23I1OAMLDXJtk8zCUj1aQZL7
	OPTre9DP9JSnZMJB29Xl76vH0j7F+hZ9K+ZbPiS4a6je4mbwCjzK3bCmOIBdLd1bXT/hYveazfp
	xv5jryoA7dQY1tissOyUu+70ytFKs7l2TeWEl4xNjg5SXA+LqEboYYMjCUln1L6SibPq+ilfphX
	8N4k2eYY08FnqGwJR8/y2/m7pzg7WvT4hq1MtAthfexGTJP4DwtqZ/IwE9k4Ng544nr6r5sCg8W
	2/NF7r90yfuy0NBMqAKKId
X-Received: by 2002:a05:622a:5883:b0:536:723f:5de7 with SMTP id d75a77b69052e-55d49300e66mr9489141cf.4.1794859463659;
        Mon, 16 Nov 2026 12:04:23 -0800 (PST)
X-Received: by 2002:a05:622a:5883:b0:536:723f:5de7 with SMTP id d75a77b69052e-55d49300e66mr9488661cf.4.1794859463022;
        Mon, 16 Nov 2026 12:04:23 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:04:22 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/9] userfaultfd: assorted fixes (part 1)
Date: Mon, 16 Nov 2026 15:02:42 -0500
Message-Id: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJh+2oC/2WNzQ6CMBCEX4X07JpuMQU9+R6GQ6GLrFFq+kM0h
 He3oDePX2bmm1kE8kxBnIpZeJo4sBszqF0husGMVwK2mYWSSiNKDanvLYRoIkHPLwpgFSKSMq0
 91CLPnp62IK8uzZdDam/UxdWzNgYO0fn39jnh2vvpEf/1E4IEKSssbanrY6XPnbunR8tmTzaJZ
 lmWD8zFP/bFAAAA
X-Change-ID: 20261106-uffd-state-fixes-d2111e2abd48
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>, Breno Leitao <leitao@debian.org>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=4488;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Q9vtBat7EPzKier5uhGvIcHrOmBQit4JDniJ4SvUP3U=;
 b=PuIj7+LRsMk4tLVOsesIjArbol6E2+mE6zXf9UwUvZaWh2Se6zEfg4r4N9uXEER+0YOQl25l8
 ZbFg9uq1kztBgkEFbRdYqBvvGW1Tl6vFNKqc30ZQz4B5pydamoG5nJC
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: rCICcXBSQVX4fd7h7G7XuSgupLA_-B_1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX/i4Fr4Ohrrry
 qEglqidL5mKCI10bTZRh/duxmGjx/1uWvZ9MfthdCEnHtvp++Rdgack4W/tcq0vo7hhZblIyFXV
 266N1ICad69yGEKr3O0KLNFPfXHszSH/JjlnJtgqd1iWcRhLS1t3
X-Authority-Analysis: v=2.4 cv=Ta0DJhQh c=1 sm=1 tr=0 ts=6afb61c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=bC-a23v3AAAA:8 a=zAoRp05x23iGVPMylqYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX29R7eIUOhUbj
 XAAa10+a1bEaLsXZEYj8k4oSBEbl4uSRn9dGxEYKlChatvwRJeMd2UFjssJOcA+gCo1hMA6DkYf
 2TmZmqFcTTAPlMmnVH5t+aGS6HL9a4mz08ahcAHS/EOOoBrAj7w4ejD6WTDlAFNmkqD/Jqc4Vtn
 WfnGeUX4knyrWqm8Xhk3l6n8VDloD1dJOd0TSFm0j2Z7TzRU8kKLRQAOsk5nhh21TwKqdch8UoL
 JE2uoiEQQZfEL4xP/U+CoAJS98iqejrMCzir5ICGLTYS/B62Y9q4Bf3Q8XreV5ilBkhu9yEpOAR
 y6lQ23hWT9CgMM/dJnwrITr7AL+Yq4N/+wS7WMpSyD5lQVf+n2jCzftEENA0InU7sj0GgzKBnAz
 U+9HqjpAyqrsbk7S+j4Dfztd/hbl33md2tbTS19wQIOGEvg84TTXngHW6arGTHXe1IouiLgP6Wg
 f4tb2EM+JJWyVNEDGRA==
X-Proofpoint-GUID: rCICcXBSQVX4fd7h7G7XuSgupLA_-B_1
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=10
 phishscore=0 priorityscore=1501 bulkscore=10 lowpriorityscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160080

This is a first batch of userfaultfd fixes, with more to come.

These were found by a mix of regular old LLM review and by having an LLM
write a TLA+ model of uffd interactions with PTE bits and other state
and seeing what issues fell out.

Most of these fix places where mm code loses uffd-wp or RWP protection
while moving or migrating an entry. Userspace then either misses writes
and accesses, or gets pages reported that nobody touched.
There is also a hang in UFFDIO_MOVE, and UFFDIO_ZEROPAGE modifying a
file through a private mapping.

Patches 1-2:   UFFDIO_ZEROPAGE and UFFDIO_MOVE fixes, cc stable
Patches 3-5:   PAGEMAP_SCAN write-protect vs. migration and
               device-private entries, patch 3 cc stable
Patch 6:       UFFDIO_MOVE of the huge zero page from an RWP source
Patch 7:       mremap() losing uffd state when a move fails halfway
Patch 8:       migrate_vma losing uffd state of a zero page
Patch 9:       UFFDIO_UNREGISTER with a misaligned hugetlb end

A few of the fixes change what userspace sees:

 - UFFDIO_ZEROPAGE on a private file mapping no longer fails with
   -EEXIST where the file already has a page, on an mm that cannot use
   the zero page (patch 1)
 - UFFDIO_MOVE returns -EEXIST for any huge destination PMD, not only
   for a present THP (patch 2)
 - UFFDIO_UNREGISTER with a misaligned hugetlb end fails before
   unregistering anything (patch 9)

Patch 6 has little user impact on its own. It is included because,
together with patch 7, it allows removing clear_uffd_wp_pmd().

Patch 7 adds spurious write faults on shmem and hugetlb after mremap():
when dropping uffd protection there, change_protection() makes writable
pages that were never protected read-only. UFFDIO_UNREGISTER and
UFFDIO_WRITEPROTECT already behave this way and lead to the same
spurious faults. This will be fixed in change_protection() in a separate
series.

Based on mm-new.

---
Changes in v2:
- Collect tags (Thanks Kiryl, Lorenzo, Gregory, Alistair!)
- Patch 2: say "softleaf entry" in the commit message, per Lorenzo
- Patch 3: add softleaf_is_writable() and softleaf_mkreadable() to
  leafops.h and rename the helpers to say softleaf, per Lorenzo
- Patch 3: add Reported-by and Closes for Breno's report, and cc stable
- Patch 4: explain in the commit message how PAGEMAP_SCAN set the uffd
  bit on writable migration entries, per Lorenzo
- Patch 5: use pmd_is_valid_softleaf() rather than open-coding it, per
  Lorenzo
- Patch 7: say "write faults" rather than "minor faults" in the commit
  message, per Kiryl
- Patch 7: trim the commit message, per Lorenzo and Gregory
- Patch 8: trim the commit message, per Gregory
- Patch 8: Cc the GPU driver maintainers and lists, per Gregory and
  Alistair
- Patch 9: use IS_ALIGNED() and a local variable for the VMA's ctx, and
  shorten the comment, per Lorenzo
- Drop the three guard region patches, per Lorenzo
- Link to v1: https://patch.msgid.link/20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu

---
Tal Zussman (9):
      userfaultfd: use anonymous memory for UFFDIO_ZEROPAGE on private file mappings
      userfaultfd: refuse UFFDIO_MOVE into a non-present huge destination PMD
      fs/proc/task_mmu: downgrade writable migration entries in PAGEMAP_SCAN write-protect
      mm/migrate: keep the uffd bit when restoring a writable migration entry
      fs/proc/task_mmu: write-protect device-private THPs in PAGEMAP_SCAN
      mm/huge_memory: build the moved huge zero PMD from the destination VMA
      mm/mremap: resolve uffd state when the context is dropped, not during the move
      mm/migrate_device: do not migrate a uffd-protected zero page
      mm/userfaultfd: check hugetlb end alignment in UFFDIO_UNREGISTER pre-scan

 fs/proc/task_mmu.c      | 42 +++++++++++++++++++++++++++---
 include/linux/leafops.h | 51 ++++++++++++++++++++++++++++++++++++
 mm/huge_memory.c        | 31 +++-------------------
 mm/hugetlb.c            | 27 +------------------
 mm/migrate.c            |  2 +-
 mm/migrate_device.c     | 23 +++++++++++++++--
 mm/mremap.c             | 46 +--------------------------------
 mm/userfaultfd.c        | 69 ++++++++++++++++++++++++-------------------------
 8 files changed, 150 insertions(+), 141 deletions(-)
---
base-commit: 67f3b04b277373438f17300e056306adbd9edf7b
change-id: 20261106-uffd-state-fixes-d2111e2abd48

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

