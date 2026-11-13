Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.240
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794539068;
	b=o/MhDgGvEJ/hi5/8de66hokk896/WI36pYP909Zgfe2rSZPGoZCrwMDm3OS+qqr5fP10
	 orptGZkE5BmRg6fkkdU3M7hqcsZXhLNq9e+pLyMH2jKezqVVFg27/Or3vV1PPMaBHeusT
	 iKc4l6hgW7ZymQXxYwshRZsFEYP3U5pohwWcCghQncsz5DvQRR6GTasB3iDCkVxqPBMk7
	 TrHjVFU9Hy31qQb1QVWSH2erx3cxcJZs7lal7g6VAbCfR3HYB27b707PIvl6LhndnoWq2
	 ix4dmnkhjmeGcoDNBKYu0yw4D6oAXAWTb3lypIArgUcT5fiSZ/ni8YHxpYq4WFs5jXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539068;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Orig-IP:
	 X-Proofpoint-Spam-Details;
	bh=GmhdQpGdswduzF/2xD0IuaeRK/J2SvLotUiBA4mm4f4=;
	b=FfEUx6O7OeIs1Upa6xsp0VPwvgtwwYxVoUyvCR5M6Ja3LYmFulpqTxY9k0ZQ4VR9vyzC
	 EWjYPABqQk3uJlYpG1didAB7BwDTSFegEBCvyMvqZZ1wCjMWw2kcRIqFr2pn4Zv4BXt21
	 1pZZNB1ZWF46HCCQFtP0owTnI3A9K5erhCIlU5V9JF5dWyvdj5GjszixcEjVBvAcmlS2V
	 ILcpNkGBdehh/woHcYMgReU/avmpLSW6wMTkzP30Ze4z6F046uB+8U8XPHVK8HrAtfSTR
	 UHS1cckQFZ8rC1mPpbsU0MHn1TYsZ/gTfwklz49yhYJFnt+cpjLuYLw+G569p2HqHFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nyu.edu;
	spf=pass smtp.mailfrom=nyu.edu;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=tPsmLIyV;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=W6w7REez;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.240
Received: from mx0b-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEB9606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAEB9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=tPsmLIyV;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=W6w7REez
Received: from pps.filterd (m0094546.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD1hVL34003781
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=20180315; bh=G
	mhdQpGdswduzF/2xD0IuaeRK/J2SvLotUiBA4mm4f4=; b=tPsmLIyV5N9LbrCjK
	y/kJhmKki55kqypF5HyeUTxmGjlG1VgD8yz0dhCkeGdKa8iPhEu9yykyQuEGzdDm
	yIehzkFLhFvP089BJWGo1eAhv+pyg34OeoiBP1p+rCu5EZ/WcXI09qaWmZMpFjf0
	dVE34X04y3u/shxLNrl3282uW6lm/BH+dRSHorTDsjW36ffLhx4Bp7cvxPOulusu
	3HvotgAbEKSkngRmjH3RyV+W13uDT4SyHWGaAX8bWlxbyuZZPGLZdp8/XLKzYm2t
	WU6eCrmM/GKmOsx4sdy7DhIK/INDCOim/CYzTSfIxWR3Cf0qryuxr+C/D8ETp55r
	Q+rDw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4hwmjxmhdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:04:26 -0500 (EST)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so601935eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:04:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794539066; cv=none;
        d=google.com; s=arc-20260327;
        b=Fp4sLB2O8Bj5eiQYZW3wpIxHu/s3hj9ZnPNY4vNIRc2nHyHw3n7VaEEwU6HkM1sW/N
         tpYR+S/yorNNobrBxAxEPTgL6Y11jBa3n35MG8FVbYqXXmZQkmcj8Zv1p7oS11S5pAyg
         MmlGqVsiBKpDl8m9ldxq4TTxxDsjBRfD5SbsErCxGnnVxSpViYBMVk8DiIJdK514DVT1
         g8HtNs35mBiZLhKfTHjtcEt7GQ8srxZIgME2goPogx6zrf+7hUhmNiacJOU35651jswh
         lNVOci2QMtJRNkcUgMG2OcaVnqhDHrre7Gx4wb/TrefuShOxiTEY2V/Oxo5bo8WB8q9U
         HKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GmhdQpGdswduzF/2xD0IuaeRK/J2SvLotUiBA4mm4f4=;
        fh=PuTB7fSLWIrAYkn/LG75LpX3YzAuf850we1UImJDaYg=;
        b=H68MrWi8BeegQmKkmXrVv02EHlbWOazBoDWf5m6UIpKg93VoJu+plKmGbVGvTOvbnv
         dANSvhc80EDDcrEpfYmrnpAjPgNTIxfu2IqBhdx5TiiPD+ytKDW4XXnAAdu+Uum80lO+
         FuonKirTFXnfquLD4QNJ9uOmlYlO0e2DgEmg3EIeCMDBFvRWIR+bYAd63EoVp3Jcc/Dz
         x+HkZ6I0kLu7XHy9kzYmHX+uZ60VEZGxYKGYkMpV5f4UNKXOv4b8o5zzNQlSYbOQ6AMs
         70GtlPSscD394MO9NDimnPJ8xxH5TJIm21UWHBKwRyiK9BQRV0ISYxHZNPXkRIs5PnVM
         ieEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1794539066; x=1795143866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GmhdQpGdswduzF/2xD0IuaeRK/J2SvLotUiBA4mm4f4=;
        b=W6w7REezAMGGfzxGgt7jJB9EKaKguq5qIu4pJyGnWtQ+4RrrN+W5y1rMZX/029+f0y
         2lF4DpfGdkWIp00i1JimnlBZhT+n1v0Uz3OpyiXAQ+t2hOlfGX9JqUplhSpf/At/vsBx
         IrZdY37a3++dmIdSXtTAaJ3XXoBQY0s9FhUgastDW1xWO8Tez5TQHBr8iguGrdSs3K2K
         7rQEPU0pTwy8Z8WDYj+GNvI6Z31kQfOQTYlXj7HIJNZ7Y6/TkKJK3ufTk8djDEsPwtsJ
         kUWxc2siS7T9Tvath/wowTJta3EarpXVjiEoonw209ppE92DitZGIRFzltsGHDsYh0E0
         osOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794539066; x=1795143866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmhdQpGdswduzF/2xD0IuaeRK/J2SvLotUiBA4mm4f4=;
        b=0TegQGrIjuGgjJrtLuIWh/S17++shlEnkhU8IM1D9QcesSYxrF7hQkv+GhMdsO8Ive
         eJowS+W/e9+EodUkqhzkXMxZa7nNL/mQFr1fHVtvjR33UXfxsh6YVOm+ZFhPOpFe/Bzg
         424+qx9pqRCiwVQRUOP6WYllVMoQJb18uvajXjDg52wQoeBFRHANkvm8I/GGLMjV33v9
         N7fGXNASA/3iugKUH35ElqE2lNKU9QWG2FbQQILuXGpKCd95vbSeKf91RA1Ramhbcu1W
         uLsneDNRI/cMXVBpiJITLKVNJxo9c4fukYvLhC7QJafX0A6VDpcF/4VC2nymlGwEMSdk
         S1uA==
X-Forwarded-Encrypted: i=1; AL+hErEhMcDU1nb8epqT08rjQUKLHTB5XsZLP+qlU8BoN93z8/msloaFXfbO7Vko8DVJo1jtb2XSlDjwbuP1m+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r3K34G28q8LtJHTiAMpTosXBmjg4VsfMSlSpGDRZv6O0N3B3c
	fIaqYauQq7k8uUnzQgkfB6KfGfTJTN4cEE4eGucWUlP0Lxlulflv4RnTk9gutt7PPF3OZ4dkAOn
	to9m8rtT4nqiEYUSIcXjVmRmQqy86rGFNd2unfrR9gfAQqRoDRRwvb9wedAuxFK7mdmLryae2Pg
	Wjhuys+KOPlP0au0lPcHVqwxCUA9MtnUeoTiw4mA==
X-Gm-Gg: AYBFou3FBO/1awRMSlFPbE3qijZEj7XBEMqhnPwaYpy2uBKcc5V+kDz7Kl4xP5ZCKDy
	OBbwj9mpDWHgh/xGO1n08PWBEYo0L/YpEXiWJgSeL1w6HXpOsgkYu/xW6XSokq5ncsWKFCTh7PG
	QOhNE1FJYMl+Q4Qshx1Kabwd5W2qr9eOCEHXL3WaVXWzkUHHarLNJ4I5xxEA==
X-Received: by 2002:a05:7300:fb17:b0:36f:6d81:3f99 with SMTP id 5a478bee46e88-3796676fd59mr975906eec.7.1794539065999;
        Thu, 12 Nov 2026 19:04:25 -0800 (PST)
X-Received: by 2002:a05:7300:fb17:b0:36f:6d81:3f99 with SMTP id
 5a478bee46e88-3796676fd59mr975887eec.7.1794539065469; Thu, 12 Nov 2026
 19:04:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111033150.847104-1-kj2864@nyu.edu> <CAOuZWzyKFAfOFDu1p8O4M4qCS6WgvTXtoFq89wnZSx3OcCXz2w@mail.gmail.com>
In-Reply-To: <CAOuZWzyKFAfOFDu1p8O4M4qCS6WgvTXtoFq89wnZSx3OcCXz2w@mail.gmail.com>
From: Jerry Jiang <kj2864@nyu.edu>
Date: Thu, 12 Nov 2026 22:04:13 -0500
X-Gm-Features: AclHuK84zNQZL-Vn9ypJzxeh0nfI2T8c8JoATz7C6GkFQJ099lS7ynWbrj7mP8I
Message-ID: <CAPqbLS2exums5i9PX6SA37MMdRcxsOZZqnEBJuYm+HsFGtPzGQ@mail.gmail.com>
Subject: Re: [PATCH] ceph: Use unsigned types for snapshot split counts
To: Xiubo Li <xiubli@kernel.org>
Cc: idryomov@gmail.com, amarkuze@redhat.com, slava@dubeyko.com,
        ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        co+408fcc361565713f@bugs.sh, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: LsYQXnZxMQjlPLkdI8nSO1RtDyKZ5vyt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMSBTYWx0ZWRfXy6zhCa/W9VHQ
 iNNcACjjQcEuy6lCKAdkQkIaK8ueMJxNh424/bnEYAB60vjUCIYKQ8HdbShv0RLHFYU2s2l0wrl
 +QOD81K5l/M3Ls06B1mtiCak94AzwyjP25flTirRYB8FaXxQzKcxrD2Zl9AsUQMinMuZlPF2RKW
 kOUD8X+LEy9Y7FqadbLzH/zDYV+gAepu/tHbV9bgF2ybJ1bra8BskHmDDDdwzb3JIgzljPQwdoI
 9KRpAUD8LL4UJcUmfeFOs9HcYI56p/JMy77AcxWInJhUCNYwPdYFm8dIh11kBfCjgAYEGRJHZ4H
 e00y8Nw9qYn080gaoclbdz6TXuW9p2XiodnRxmiE+usLoHm1zRNB/25G/KZ1TU4jSanITStNv4m
 zvHsnmBTfwQpxTo0g433Tuc78RYpzwTuZIwtU8/WaYDnWZkJf47XcoD/1Rj7zcuDgZIO1Ez0QN/
 CrJx1jGsRGmaJyBCSvA==
X-Authority-Analysis: v=2.4 cv=W82txhWk c=1 sm=1 tr=0 ts=6af67e3b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Se5WoFf3ZZRiLcel0nel:22 a=T67y4n-0JBmO_r8OIWtK:22 a=VwQbUJbxAAAA:8
 a=zb_47FFdHMeEVrkQdFIA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMSBTYWx0ZWRfX0wUTv9jDb4u3
 zz7pxXAO0t3Xv0wNQWmtyQiGmvt/ZvhnFo6tdLHHF2n3rPgTZonNbwQ/doBxg3071VXuiOaVrlY
 mtdscarDP6zDRS6k4UrukHiC5HJAeo4=
X-Proofpoint-ORIG-GUID: LsYQXnZxMQjlPLkdI8nSO1RtDyKZ5vyt
X-Orig-IP: 74.125.82.198
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130011

Hi Xiubo

I've made the changes you've requested, please let me know if any
other changes are needed.

v2 has been proposed:
https://lore.kernel.org/all/20261113030257.1061200-2-kj2864@nyu.edu/

On Wed, Nov 11, 2026 at 8:31=E2=80=AFPM Xiubo Li <xiubli@kernel.org> wrote:
>
> Hi Kaho
>
> Thanks for your patch.
>
> The u32 change fixes the backwards move on 64-bit (I reproduced the
> KASAN slab-out-of-bounds with injected split counts and it is gone with
> this patch), but on 32-bit sizeof(u64) * num_split_inos is still a
> 32-bit size_t multiplication and wraps: 0xffffffe0 still moves p
> backwards, and 0x20000000 leaves p in place while the split loop then
> walks split_inos[] far past the front buffer.  Could you bound the
> counts before advancing p instead, like b3bf89767e3c does for the snap
> trace, e.g.
>
>         ceph_decode_need(&p, e, size_mul(num_split_inos, sizeof(u64)), ba=
d);
>
> for both arrays, and ceph_decode_skip_n() in the non-split branch?
> Also, please rebase onto the current testing branch.
