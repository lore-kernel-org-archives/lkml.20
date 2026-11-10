Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333525;
	b=qyj8nPFL+XnDgBx1VUf5m920SU1eAyY2VkOhqiXzirkKGHOO3hnCxJgdHssGGbVgu1N3
	 wf/qfbYWwBwsZWsH6kctBCu4GKcgaZQsKAS5Tu3+qugUJ0yRKHzCXV6DfRpg/huKd2zQ4
	 k+CKeJtSmPCNNXraJGtgqdxNpOlG2I8Qvuh0YW9UPzjIAUGpFrDcRBWNzj+Alb937qTsL
	 5d492lpgykWAEVpk7xlQCLD6b38JOwyVb3aik/01N5q7IDZ9Nh6qGyJfdYKyipKiflN2Q
	 FEl2MRoABq2FzDpECH1CCEOPYyp6h8At2b4JGwOp7SrSK+aZ4gcU6k6v0VbptBYOLRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zPFsZgyaCdAHrCU/fXJ3x9ev5UW6Et+8sbyRNxd+Myg=;
	b=dVSpY98Ey7ELPI9EyMyj8O1INF0yZtrWou4Tx0qcJ+Sp6rY4etvQN7vuarl+C736nIXd
	 1UyChGs+0YGQPFqKW5SbZXbB5f9OLMQKTr3T9z5gS774f8WAaOtvtZoKTHD/SHw6bNkJG
	 cgpZSc3rFWtdq1X+MEZ6xFcEIfaxLr5fSl9FduajI/i+nraZfHDxYwG1BlXn7Om0wYPmE
	 0fg8VsJNmorWyoHP9P9LBw0lDUR9VEaLWp9VZhY30AsoNcaOWNT/7haN0OCCXug9wnxyy
	 EjTJXNCkKEJbtbQ6rEDsjfNfhnO6Eh+QHdNKIN+b5j0VvQ/2+86KfUfg79QlN+jvxDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="C7/luK+m";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QtB0aOQ1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9E9606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F9E9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C7/luK+m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QtB0aOQ1
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF057R141501
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPFsZgyaCdAHrCU/fXJ3x9ev5UW6Et+8sbyRNxd+Myg=; b=C7/luK+m2l0JX3ZE
	ENMS+k7w2WZ/oKWuTLwKzysb30AnzxUEO9HUwIcFnwcia1QY0SyjLjA93tCjz7LJ
	jxb2X4B38s7xCtPL0p9pJx4i3liKV1K218M0zxODd8lf9tzqL7d/0Ib6Bde8HhS1
	1IIrVerrbYE8c6xnMpClh38OzXsVGO0fUqcbe8/E6IWbs3WMBH8Db8rfCI09Q43i
	y9CnwjS0KoqY6hCycaj5jYDzpK1QJ2+V9KPKFfxh4ufVhvOIACY4bzrLfYkN5iLq
	pjqj0aNHOSvwRHZ9i/ML97+XTrdybQKGV6YurYIQm6Pehyzl247v+1jEmcVa5ycd
	pt6D9A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg4qn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:58:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so829252eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333522; x=1794938322; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPFsZgyaCdAHrCU/fXJ3x9ev5UW6Et+8sbyRNxd+Myg=;
        b=QtB0aOQ1ocsXxyJpwT6umWRIyDtOQK9Fu4M7qWTPUovfuLTiq2poalcPUEo6r2awrm
         YteXCl0A1KEuDCUsw/K7beFjYn5W4diatoEFDCURzxHQatWk7lSrbQAna8RxbCDx79uw
         mamxRoUPRYqPoceK1d+BvjRt9DFq5a/wWFhw4i9dNBByUqnz8m5W+5CblWGq/hqr0Tqv
         mGgfvlYwu06R8HHUdGuZhhqOBzqGAldZUxwHW7q2gflSHHV1//uqt8JUidEtQeYMJ7Gd
         kqWh45PVz9+Tv+J/eGszJWA8eDLjrgo1sPdP/v3xowbamBFABfVazPAVXw78JJGDfop/
         Cucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333522; x=1794938322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zPFsZgyaCdAHrCU/fXJ3x9ev5UW6Et+8sbyRNxd+Myg=;
        b=bYRcG2WkaBeluIJBfOZjVDsHFZA6cWi53cRkmybM245ppssHIoUnzIUBlS8es47bkp
         sT7+8CRNuvS4oPhh2yxcIlRNbzHXoWqUZ2KL8Sm1qxOcv7l9O+fJihRserJEbaAbqDmV
         qb+rcHAuFEzdmRuIlJ6CdY/MsaYmvC5tlTyXOMX7TqI6XMmOBVolRpfnKXuRmWrJhWpx
         14ZUbClzCbM3ZTKRpFlQ+mhPfMQMTqsqCXy04MPrMvsnvRRUqqcV3d0CA1r/yZbXF/4d
         JTKsIK0cXeIyJaf/2a0zejY/EfzfvYgbzaDG7tyS7bvQNJvWo7x5g6t386+HGz6SJHKi
         CuXw==
X-Forwarded-Encrypted: i=1; AL+hErHwGytKWSlHHtTpZUBFHnpJDdN1mLi+Rlr92ze1H5myMwzUjMoVPbL3VKfGw79sLqDiqv88ceiEB64ra0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mzxkNkb+HV8BlYQh7dHnEwDj6Bo8S1VWVDddSDBkwG6WbP4EI
	/QsuS2wgpODCJpjD6OkSVyc9xczepnzLPV088SJN4ezOUNxeM1bEBtrBDa9CO+R1jEN6N/G8guW
	8PA0WSF5tmRUwdE3qd+J9Q0T6f3acxw0g+mIlYs2p2CRmWEC+IIkr1Rbk1O8L2m8Y3i8=
X-Gm-Gg: AYBFou05ojFMjCh94JgJJ/Gy6wNUQXyapMrQYWJwMOUaHQHc9I3blGje7wjn25Kgcnf
	q29PpyeDgH4mKUrWcB07u+tV7H+zmtpFTwTHDCmWB363IvJByiwiw1jK8h1vjvyMbbYJlF0Km3m
	T+HDnMLhkF0fYazWPvir7IyGJvtKOHlYVje4WBLXtet2QYGaf57R7iYtlgx7nwtuDyrdyBAGwfG
	EUo7Wc1Cmt5WhXaC4e+QrfnX45SDoySLJ8+lc5fAntNnnS675Z9vha4+ln9wi0QNQWKcBbTOFbH
	HG0IkDIDNb9zsm76I5YZmzcdMj/46EPlr4b/tcGMcHnIIjiE8biVdue5PLJNt4txO8N1sR22Vzb
	HdL9JI2n6nUBOleWSqWT3H+j/nsP63pQWgvs4Wbo/ufy2DZqMmSTF5+cKg50ysN8AFB8rvDUlwL
	eU971tj7ECWo1M
X-Received: by 2002:a05:7301:4d12:b0:359:8492:20ff with SMTP id 5a478bee46e88-37685a83888mr29217eec.12.1794333522223;
        Tue, 10 Nov 2026 09:58:42 -0800 (PST)
X-Received: by 2002:a05:7301:4d12:b0:359:8492:20ff with SMTP id 5a478bee46e88-37685a83888mr29190eec.12.1794333521516;
        Tue, 10 Nov 2026 09:58:41 -0800 (PST)
Received: from 20e739389ce0 (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm592226eec.1.2026.11.10.09.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:58:41 -0800 (PST)
Date: Tue, 10 Nov 2026 17:58:39 +0000
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/4] checkpatch: improve exit criterias
Message-ID: <avNbT_IRhemIX_Xw@20e739389ce0>
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
 <671a7f6bda4ec81f56e3eb7ee287bce4a96b9d5d.camel@perches.com>
 <CADLxj5T36OOBR4J1HGNT3U7H1FwwvSPmBWYRM_vGAEsXfWT0MA@mail.gmail.com>
 <42048f8fba5c2726a488b28e94625938bc045f5a.camel@perches.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42048f8fba5c2726a488b28e94625938bc045f5a.camel@perches.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX9Hz9SRbgKaBq
 1glkIp752X8MSXz0k6k+lVW6CJ1Yo5xNSC6olUOBmb6kTvCs3jxL28u3KMhG2UUHgiejhq7xHQn
 U8U/ST9JBmOzKmBGZNMfpUGZa6L7Y4gYh9rQgfsu20v9TFIgk2vR6WAz8MdSENYT/WRW9Ryf94X
 bkxGOOguifQEveuBGm3d4wfVUUge2u0580WQz2qGVbWXB56Zhm0b6ztLiaUQrtFrY9N87jaHg7t
 z53IFeFEDODNm1IAEWx22enRiJH8YUKYRTVrikHBQvOV3ehOj0s/TqrhqETTm3F+Vrwr1P2m1X1
 puerzPPLoVmIGCqKrzMFRYB9r9QdrJU+i84LwY53YPkp6PdvsAE9uvX3ox0b6yzw1j3FjXg1gMY
 qWpj5J/4s5WsEyWyJLVeAJ5aq6AC5X/W69yzXTtjp9orhFiIqQe2e89SjVSP65Wnj56tVMwyiaU
 VQsTJ8clM1Uot1SpMKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX6i/oUO0z8YUm
 nUwGkgSdFUa8M1uG05PoOepG5OXJn318OXFMohigzsHIgBpPZqre/PnCVUJm0uU+7tehDOQiMel
 Kcl+qMQ0zey/eui9J2ci/4NaygKEUbI=
X-Proofpoint-GUID: AHfNODYEEoyf3KHtzx61sqkzThudpPWp
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af35b53 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=IJv9LcIfAAAA:8 a=F-nW4nSZl1667gKoV2AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-ORIG-GUID: AHfNODYEEoyf3KHtzx61sqkzThudpPWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100071

On Tue, Nov 10, 2026 at 06:54:06AM -0800, Joe Perches wrote:
> On Tue, 2026-11-10 at 07:42 -0600, Bjorn Andersson wrote:
> > On Sun, Nov 8, 2026 at 3:04 AM Joe Perches <joe@perches.com> wrote:
> > > 
> > > On Sun, 2026-11-08 at 04:21 +0000, Bjorn Andersson wrote:
> > > > When invoking checkpatch with the --mailback argument over a range of
> > > > patches the tool unexpectedly exits successfully on the first clean
> > > > patch. For example:
> > > > 
> > > >   ./scripts/checkpatch.pl --mailback --git v7.3-rc1..
> > > 
> > > Why is it useful to do this?
> > 
> > My use case is that I create a maintainer branch off e.g. v7.3-rc1
> > (now v7.4-rc1), then apply a bunch of patches and before pushing that
> > out I run "checkpatch.pl --strict v7.3-rc1..".
> 
> I think the description for mailback should be changed to
> be used only for a single commit as this proposal would
> otherwise change the exit condition for the single use case no?
> 

I don't see a problem with the description, but making --mailback reject
cases where multiple inputs are provided sounds like an alternative
solution to save others from being surprised by this.

That said, it's not clear to me why:

  ./scripts/checkpatch.pl --strict --git <hash-with-warnings>

exits with status 1, and:

  ./scripts/checkpatch.pl --strict --mailback --git <hash-with-warnings>

should exit with status 0.

Or why:

 ./scripts/checkpatch.pl --strict --terse -f missing Makefile

exits with status 0 and omits all the warnings from "Makefile".

The intent with my series was indeed to fix "the single use case"... all
four of them.

> > But this is quite noisy, and the compressed "b4 prep --check" output
> > is more what I'm looking for.
> 
> My b4 version is 0.14.3 and the man b4 for prep doesn't include
> a --check option or description so I don't know what that output
> looks like.
> 

It effectively looks git "git log --oneline" mixed with the output of
"checkpatch.pl --terse --no-summary".

> >  So, I borrowed the "checkpatch.pl -q
> > --terse --no-summary --mailback --showfile" from there and it took me
> > a while to realize the difference between:
> > 
> > --mailback                 only produce a report in case of warnings/errors
> > 
> > and "don't produce a report if the first commit is good".
> 
> So perhaps just don't use --mailback?
> 

Of course, I know that now.

> And remove the --showfile so checkpatch adds the git commit id
> to the output and maybe add a front end little script to do
> the git commit id to commit subject to make it easier to detect
> what commit might need updating?

I'm now using "checkpatch.pl --strict --terse --no-summary --git
<range>" and that gives me the compact output I was looking for.

Regards,
Bjorn
