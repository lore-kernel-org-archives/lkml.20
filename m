Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA63B42C7
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029026; cv=none; b=jMy6WmBLRDCEaut3nlEUSeNaeYwfT5fgIGoInRzBug8NTyHKVOjt4MBpHpQUApv2XGhL4yL4goG41Ea6D0j76wI7WY6Yj6Ud9FPaohs/Zxyf+wNhN5S1hh6uUMZmnu9MILb8uyq/JjJ1kMM86rkg8vKhIUBhdwDuDgmFJkWstqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029026; c=relaxed/simple;
	bh=ld0OrougPNfBp6Ry3148Z2Li9neJoj1Ak158VsVyVmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUDxGTVaqicY1Q4JQ0lI9pK55Of5o+QgcSDxYyiVp8KKGcP/yF4RyulkS5iA2R1NZU5e1GbOgoiy5SxvP2Z2CMmjiQ7PVZZ5WigtlD89itOKgUC6z/yIVGwHP8WHOY0pwQoCppH7+uCjUHHP/8NVJVIfwjXnY91857SBxqiMHNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaPbbMLi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8M1vlhI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaPbbMLi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8M1vlhI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693AtrKJ3312803
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 12:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ld0OrougPNfBp6Ry3148Z2Li
	9neJoj1Ak158VsVyVmo=; b=iaPbbMLi2rtDwRfy/OT6hy7GqUujdf404T8d/T9O
	sKhA14+aPKlNSOfIAqwoI9Gqe/qCTLjw6wpZxa4xs6HFlfDxQzBEX42km7tthw4Q
	GIU/WQkR1xGKW1jPoz/QxCZEoDAca/pBbLT2F/9RA4ZZT8gI1+6SWavNpYhubaOF
	KEvO4F+TPCjusBwwIroVCK1YeFKbVF5gKW0IfqNIUOQKCA+LnZXRAUNZswGfOxAo
	MG2bnrEScHPcrhNycWBdjGhCjF48ZJoNeU1wXl8VODbMLgQS/HNwfKFAe6BWhmQQ
	tS3EDMQk3WIr1adwX45D1p9BWFvjjHfz5KD21rtUI3WrNg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t36grnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:03:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso168879e0c.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791029023; x=1791633823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ld0OrougPNfBp6Ry3148Z2Li9neJoj1Ak158VsVyVmo=;
        b=a8M1vlhIhAtW2DBcAT3aLVeF3q71pt/sQYSxdRFMhBNCodjAdLyQGN9zvSb+NunDch
         UVyXFHKgcISRMtF65lGpm1N4YAf1QGPZ92whZ9NdfnQsVPMEUhwqMbT/k/t9uYnkCK3l
         uXHbQDunIsEZX26IjPghWv5CGYZoOsjXLBfd8rj2C9ZlQW4GmCR69mPFfARUUkFjLPlJ
         5LV0gpzoNGr/okJQMtmO52Yemi6CclC16Yf7r2bAHfRtnmUNjU+SNn8/9hbJbyS7Ids+
         Cs1ctUGtzZH1xnQFdgtuOGNs0SFs0N0gPQourQ+/t8T3uwS3+co5KEiUiBRwbW2KE0Jk
         gxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791029023; x=1791633823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ld0OrougPNfBp6Ry3148Z2Li9neJoj1Ak158VsVyVmo=;
        b=dkd6gwhCG4yIRMOPfJYgxT5vKcvfJ0HIqRzl2ZuXm3KRoxFIITda90ORJ0WfbT2Iz7
         MaW53ICIKAe7hOtItAwi+lt4vMAqompj28Q4W/vxE/MFEfpDNNm8LwOljG3/siEkUKRM
         71Gb4NQfnt7BRzqxw6GS5Uc1KL1yQsad8bE8FOcStsK8T1OJlxFZ82+QLxR9sOT4U//T
         V4R8S+ZbgsYMZS8Z9xyTzy0lZxkrzluk9ED6ARwKH7WEjXzVkb0CTmcoMsol6He0J8JL
         kn8o51TmvnjV6IYhQajbXBpy0a1qkfk9ZUIFtMXy4QS1AHRUBzc3BDS6ZUPKTsYrl/ay
         Hgkw==
X-Forwarded-Encrypted: i=1; AKwUvBxGJN/bZ2rp3nbo+SwBjqX12C5mEfM+tJys4Fdq/uteCxovQFKwjnbKTmqOJQrguKSO/yU+oz8ddcXQMkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAC26pEqI76/et6jFNrEuwBGdGflO5ltDs1MtOShQBstAukmqF
	8q6dMCj8Siee7vY/gXHoLVOKjP+Jpi+GZp9n2KunA2Oon8s0cbh4SAdR3tjaiSv7xn/rEDms2Bq
	7/4D2KC4uEq76O5AfiK/lENcyr/2Ts7MNslhLl+3g4nRc2XO4/e/f3Ha4QcIAzk/vPip8oQfP84
	8=
X-Gm-Gg: AYBFou2009PfRoOwO/0T5hiLYdZeGihbwjWtHHqvL+8sMSP8Hk1Uc0xe+GHv9GzzVj9
	vTHvFsoymjYLuLKjwJWLn6UfpGDKotI/74XYT+JujBUcydKEiWnIzBl7BrQ2xp1fWhVk3pFCC6l
	fKhiVuHblsP6Ye/uUbidOJE37FvkKe5UGE+je+1oY8tPDYEMshQlId2pa1kan+yD7jbwgalfDqG
	G/Qu/pqXgyhtpK2qHID5WbTGqKHtLCJuTNWVCdGCh+Ev/t0puJeNxbgklNm3iwIjN/aVL4Ziize
	3sfpKTFwHD2smLcXZku7qKtb/G/Ub0PqFFuPu0TFn+qbNoz3LG8WEAnGK5BfSZlS/CxKDhO3d6L
	F9qXcs8ub1g9dELVz+Vpz8HWPZ06e
X-Received: by 2002:a05:6102:6415:b0:7c1:75c5:c4c with SMTP id ada2fe7eead31-7c175c521afmr567414137.25.1791029017757;
        Sat, 03 Oct 2026 05:03:37 -0700 (PDT)
X-Received: by 2002:a05:6102:6415:b0:7c1:75c5:c4c with SMTP id ada2fe7eead31-7c175c521afmr567402137.25.1791029017224;
        Sat, 03 Oct 2026 05:03:37 -0700 (PDT)
Received: from localhost (109-81-9-204.rct.o2.cz. [109.81.9.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394c937csm97187345e9.1.2026.10.03.05.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 05:03:36 -0700 (PDT)
Date: Sat, 3 Oct 2026 14:03:35 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 01/16] iommu/dma: Prepare MSI physical address lists
Message-ID: <pph73bajtpgp3u5vb7xjqmbrz35zs2lw7fpkhobg5jdzbjw2vq@usg3jbbneskp>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-2-andrew.jones@oss.qualcomm.com>
 <18c9b030-8dc6-4242-8e66-0448ee125d7d@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18c9b030-8dc6-4242-8e66-0448ee125d7d@arm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA0NyBTYWx0ZWRfX4DvOZpMHNe/Z
 NFJiGwqjRnpTKa+qvB7OQ8zIEvirWJRRKWrvhDiz13zD5KqSC+synTrsp6/89U3L13x/346muwL
 s5USaNIHB/7IRfg7aEGA2VzcW+xhFNM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA0NyBTYWx0ZWRfX1F8Xnozxwkv3
 wG0P8M3HtqV24V+nq1w0yTefRhHj++2+zIXrCYN3i5LHZpsdAW3ExOrMYwTVXIwOVf/gUlmrrQK
 aTGD3uZgvGcYSj3umNP+QaBmNW1u3xwSk9Z/UkMVGvhtwBtAf3W2lfyBTsSHdQ+HliO0TrN7xO+
 d9XmtGmZz6M4wkm2SlX8y+fXawIWK/LSIi5+n9laPSrSCRD2reOhwdk0z9ZeKNzm5MEbg4nZjzT
 1nWs87qWNvmCd8uvB2jj2J5wG2uo7eKqLiWoixeqv38k8VIYLo8q9JOCM3tsxAOvGjpurVUU3fL
 ezyM83oHQuqzEMulecZnvh6BwA9SK0FWIhnyDA/IWyrbqo4j063XF5iAGQfJPTK/TQde37LzwHU
 Fbm6WEO5kl/bAgQCve8NmP/4vXVvYHEysAzP726O2/7N5522MdvaasmBW4jHWJleUVOuLNa97Ht
 vGSCQ92/h8SQ0KzkEUQ==
X-Proofpoint-ORIG-GUID: jTOvsE86y9aED1F0um_I-CIl-sWV44Tr
X-Authority-Analysis: v=2.4 cv=UpH2pOwB c=1 sm=1 tr=0 ts=6ac0ef1f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=0bpig9kOJEczWR0iouTWkw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PG2Lv3-wYJ-N5-kAUs0A:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: jTOvsE86y9aED1F0um_I-CIl-sWV44Tr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030047


Hi Robin,

On Fri, Oct 02, 2026 at 05:21:18PM +0100, Robin Murphy wrote:
> You already end up adding what is effectively a RISC-V-specific
> entrypoint, so you may as well just carry that all the way through to
> its own effectively RISC-V-specific implementation

The list API came out of the v4[1] discussion with Jason. Preparing the
targets as one contiguous IOVA range lets the MSI descriptor cache the
base and IMSIC compose the address as base + CPU offset. That got
rid of the separate domain-local lookup table and its lifetime handling,
which I think was a worthwhile improvement.

I'd like to keep that model. I'm open to splitting the implementation,
but most of the added code seems necessary to prepare multiple targets
together, regardless of whether the list is fixed.

> it should merely be a case of whether a) this is the first call for
> the given cookie so everything needs mapping, or b) it's not the
> first call, so everything must already be mapped and we can just
> return the IOVA.

For DMA-IOMMU, yes, remembering the base would let us drop the range
matching. We'd still need the contiguous IOVA allocation, mapping loop,
rollback on failure, and locking across the whole operation.

For iommufd, there are also separate things to track: whether the context
has allocated IOVAs for the set, whether a particular HWPT has those
mappings installed, and whether a group needs them installed when its
domain is replaced. Having one fixed list doesn't by itself remove
that bookkeeping.

The current IMSIC caller does always supply the same list. We could make
that a requirement, but we'd need to define its scope: per cookie for
DMA-IOMMU, and how it applies across groups and HWPTs for iommufd. The
current interface instead takes an ordered list and provides contiguous
IOVAs for it; the range matching makes reuse honor that contract.

> At very worst, a separate hook to just pre-populate msi_page_list
> with a regular page for each IMSIC address [...] could probably
> suffice without any other major structural changes

Is the main concern the range matching, or the shared mapping path
itself? Apart from lookup, both paths need much the same allocation,
mapping, locking, cleanup, and descriptor handling. Keeping those
separate seems likely to duplicate code, while factoring them into
shared helpers seems likely to bring us back towards a list-based
mapping helper.

We could handle lookup of existing mappings separately for the single-page
and list cases while sharing the allocation and mapping code. But I'm not
yet seeing a substantial overall simplification from requiring a fixed
list. Is there more bookkeeping you have in mind that could go away with
that restriction?

[1] https://lore.kernel.org/all/20260820214150.545737-3-andrew.jones@oss.qualcomm.com/

Thanks,
drew
