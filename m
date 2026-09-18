Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3458249AA44
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729819; cv=pass; b=GlqHUmPeSZl/XvDtYUJrqWACxx1RbEKoQpJqKpP/eWKTS0vQLd50DziMss/NyxX5ry9FFKMQWetbE05PGQHkxwpPBmdQuKWkRLB40ZKUB9KiRaiaWlkpexlKlysVopi2X4lVbqRg09+2V1pcuaRBKIqUURQllP/jXgMzwxZG+yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729819; c=relaxed/simple;
	bh=7mYi1pmpp8N50UyfrIRnukXbXF0A2XFwLce49LgYwEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c9a4ZV1JcaZuVa37Ku74ha7UzHcB2OCcPA1uTFgpTBg4Tyr7EKCx0P+C3xHdSvqa+u2KWa41Chv4mTL9DUOmsP85juX2YHb4DRBFm/YOFckJgNj/Z86Q36MIAZtOzX4abWKdqlGzUDUlGc7zkDCYXBzHchkszcqHqs1mTvmyr3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgP9DmFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIedg0ub; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgP9DmFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIedg0ub"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9ddf13801936
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hHGk/fFt22iEw0C1ik4cFkKxs940DakHET+Ju6KARfQ=; b=mgP9DmFX8HWxEggU
	u2fsHlEJMTq8nqwX6n/+W2q8jM8JzZBOwzbEjpc1BAuenRDbTfigAwrIVSQDihz+
	oAmp5opCWo7rbCOo1qn4s+cjO64AxZpNzFlF1qYTJNxUn5yKnPEhTpKBN6jl8dUs
	Rk6RBHk048Snhp/ujycxGmbKEnw7BhHXr8/8rMJz3foMqzI5H9yFXhwXp8D7pYEz
	a1qh+6N4KDp1XY6lmaQO/RJomZIFmk/DKRPymPFS9T/ceMgDUSS+JPm7/YEN/Hm2
	qqmMldp+QqsdR49Eeb6OqP78oAkchXL1ly/MljRT7GJ0+NZOv/uX+FWf0lPLNorQ
	Hvhayw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ku888-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:10:15 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-86e8abd7136so6325367b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729815; cv=none;
        d=google.com; s=arc-20260327;
        b=r3WCsCdXOFGt1AYQUphSVChwfARsTiBAvFKX3HDA3pJPTeW37BXP+nwYM0rYEjNpjN
         XWC6UTqI3YmvBWQ58wIhTjXZ4J8eK1eEBJlD5ec5hbjcm0LGrP0tzY7aT6F/uqYIGyEm
         9Tcts9JPXTKTygeWENkneyhuW0MucnH4HJ7ItuoMEdWl6qNEqSLmy/kK5m2sq+MJZcaR
         1KXEQj6DY/4SjxNJTGoaP76tDJyGrCW//7hDZ8Nymb6F2OrbIeXilD+uwmqJV+SmumoN
         noCoQw5fTpdgKIQauw7JUqiRS/G/iNUmB66mPTAk8ALOel5lfkRb8LeMozqhHNAZ2vVd
         SwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hHGk/fFt22iEw0C1ik4cFkKxs940DakHET+Ju6KARfQ=;
        fh=TxY23/BH42183wBnCoR7Df+P2jM7K7ystZJ35Cy5QIA=;
        b=p2aTXeCnH0ltyOR5KMyX9pNNAmCdeG6LMCzOVh1eM1B+cjsZQismP6HL4EEbl4xg4s
         dM1bpNyLmGUxsUBOfy3Xq0+6ouEvqgfdPN7iTq7rkU9aMv60EeE55w8LbKwNmCz67y6R
         yWe3daW7xu4IaFbvfoZzMl7YVkKyJ/M9SqTb2+TExWjiqCn1owUDDwj5XbXTeMLYq4c1
         60NWMJTrLO2Cgo5tVXp1zNXTiU8CJ4nOdpLOjAM4CyQy8PgQxuZeHUHjj604G44wZSJT
         T7fV26GflhYpDZFjgqXMQFmligHvVEmq3KJ1XNWQznkvuz0QdWMG0EzpgsMhBlx+j4hK
         FLhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789729815; x=1790334615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hHGk/fFt22iEw0C1ik4cFkKxs940DakHET+Ju6KARfQ=;
        b=gIedg0ub5NUV/rWfSkCStuIyFYFCFrm1XCEweAYbfGcIqKD76RmJjohFpCc4TJKHpc
         0QwqnS9H6VHjnSdOsLl9XZMHgiVawLW4bBTWoVhkpnFps7ukjoRLvAOfoMgEH3iQGdPT
         OdzbpG4Td7yMn3kzV9FvALRwZ4RdYDJ7eXJ7XWY87drX/H2cUV3BfnW+AhHSMnAVz4FN
         7T4aetpEN7XWmE2cg2D0JIUQ8z5Sx94zwTEp0FiAcXFVkO+e7NJWkCe3ffWQBcSYoEvu
         LyHU8/YMeA0Tq+XMvs71OmeSSRB8keODAiYJwLDFeCYR/KFBMWk2O7hn6A8wX5J6Q0uy
         OOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729815; x=1790334615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hHGk/fFt22iEw0C1ik4cFkKxs940DakHET+Ju6KARfQ=;
        b=iA+idc9TP6V8s6VK+H1UoKar0YULERD55CLbJ7OiSHX5rr46vjwhjUmvF2ZCb+wBQv
         NGflvJUlYZZpD9/dqvJ5s5C0Jd9XGugc4dnF3bxy75xWi7MScWiA9LGKi8f9NUmBAPn6
         JyV5hqBGCXx21LdWJMwf93LRp9BqfCEC6zuP870ynFGgTyW/gk0Q0nJd270FJsmYqT8j
         SLDZIh0u9/f7kqaehAFhBNa4eoiahOyJ3JKyx25faB7wJYjMapfqtW13DXInyJCWbCjE
         Ev9cWpVM7KorSOyd3xhYmh5kk/SSoK1KeGlM++gxAI1HEv7eMdCCWrHSkOgPOEaNPVVd
         YYVw==
X-Forwarded-Encrypted: i=1; AKwUvBxyfdrqQ5VXIgM2rZxrDjNe8xAqQrURLakMWy2szL+c5xlNJB/m9sEf9XEv9BuAhVEXeoiqHJkTpu7uyLw=@vger.kernel.org
X-Gm-Message-State: AFuF++mm4jF2ZebHNCNECBRCFQYSvTBVRGr4x69JI2GUQl94kQa40d6I
	evJptMi9qcCB9oBqJKqGJDv/am3xG3MjRcw7AOMQ18+1eiv67Ij17Aco5tnFqw9PnXVQ63Mm5+X
	TD2a2CzgclA+Sbp0JEBqJfAJHNBKpWk4gQqaz/nEagZgmIH84i8qLCz9XwyNlBcA08yRvgYKc9V
	WG74JMk02pqdGC91+Ccpqpzw+IK3RvXq6lEv8yIbcjDA==
X-Gm-Gg: AYBFou1DK7qpqKNYk1bNFdQrdWsm9CdugnhYffI0+X7FKjj3Y4pRJN3UBqza5l0AVke
	8SmYjiOGnoaAgn4+XdJEopYl7QTeuRoXPN0JjNg3O+LFJivjgv2e3qzUk+qbueD4somZ5gJgPvj
	VZjuNTd+guY8GkI76fua7fKG2ZnUEJvoK/zMnokJJIUZDrQnK1s1j7cp6Qdg==
X-Received: by 2002:a05:690c:6609:b0:864:a8f4:faf0 with SMTP id 00721157ae682-897308fc29fmr6613257b3.10.1789729815297;
        Fri, 18 Sep 2026 04:10:15 -0700 (PDT)
X-Received: by 2002:a05:690c:6609:b0:864:a8f4:faf0 with SMTP id
 00721157ae682-897308fc29fmr6613187b3.10.1789729814904; Fri, 18 Sep 2026
 04:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
 <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com> <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
 <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com>
In-Reply-To: <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:40:04 +0530
X-Gm-Features: AcwNN1Upb_pgvF3uaRc1g74qFaXIbjn35IiykJbFBoflQjt_WLzyJvnHVSN59JU
Message-ID: <CAGptzHN5uTR8w2b3ODHoSTcys4woRBmAf0fa=93H34ZDV+=ymw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE1NiBTYWx0ZWRfXzHUCoKFydz9W
 CtRdnO0iYhfeBVQzNfjBOgbeANFGtI+g9WV/FmT5ZlVK6rRRd7c2R2dkmQrNNR0+SxWL0fpAucw
 SpmUZkNWXJEQPJnK9wNFUWpxFjPQhKpYGGsTTkPYv9AvvcHH5cyNGIHAyFv8d73FysxV+5OVahf
 wVvU0H8BJY2bMn2SPeD8+dBoNIJYn6w5DJiprKhfJZ3yQFOPG6/LFof0tgGwxnqt3w0YJrjBUxI
 Gz75g5RNGGKBuOTOZc9csGXHs7p81kBTJ3VgJGM2VytCf779bu0dJFlVooWuDPMX6aWZqyMl8Vw
 MdA1L4339Qe/mWoSfIaiV/Gp/UqZrzWpR7sh0jhSIf0gafnnU4l3GzqJktGWd8Mmkk7TLNBQTxd
 kQbqvvi0KD/qsHPTrKvBKkP8Cuo0t7kWPaU33dgzmyAXlrYlgbsVIdn/1fJ5pP1VK76F9jYxS1u
 w9Q4TE2jatJKMfqvbWw==
X-Proofpoint-GUID: I2jWDNyLCw7q7Jesyc5ermmKn4XEPcrB
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad1c17 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=JgrgwxYoxep7DTiRX_4A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE1NiBTYWx0ZWRfX02VbeFnmXtT+
 GI6GV6HseSMi6k5Bc48kIwcemK3S+8FB124Gmn/6Z6ZoKbHoET2FVRiaKV4J42I0LjIIZgUD02q
 pnf6zkEQD+kAH1uTxP8HKaTOedphDoM=
X-Proofpoint-ORIG-GUID: I2jWDNyLCw7q7Jesyc5ermmKn4XEPcrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180156

Hey Vikash,

On Thu, Sep 17, 2026 at 5:11=E2=80=AFPM Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
> Hi Sumit,
>
> On 9/14/2026 11:44 AM, Sumit Garg wrote:
> > Hey Konrad,
> >
> > On Fri, Sep 11, 2026 at 7:54=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 9/11/26 2:38 PM, Sumit Garg wrote:
> >>> From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>>
> >>> qcom_scm_mem_protect_video_var() is only serviced by the SCM backend;
> >>> with OP-TEE the TEE owns secure memory protection. Use
> >>> qcom_pas_get_backend() to issue the SCM call only for the SCM backend=
.
> >>>
> >>> Assisted-by: Copilot:claude-opus-4.8
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> >>> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +     /*
> >>> +      * qcom_scm_mem_protect_video_var() only applies to the SCM bac=
kend;
> >>> +      * other backends (e.g. OP-TEE) own secure memory protection an=
d do
> >>> +      * not service this call.
> >>
> >> Can you not just stub it out in TF-A then?
> >>
> >
> > Please don't, we don't want to support these random SCM calls ABI per
> > subsystem with the open boot stack. All the config in this case for
> > video is handled by OP-TEE itself.
>
> Could you please help me understand the demerit in stubbing it out and
> let that be a dummy ABI in OPTEE world ? that way client driver can
> remain agnostic of the calls being routed to OPTEE or QTEE
>

The main disadvantage is that we don't want to carry these custom SCM
ABIs per kernel subsystem with the open source TF-A/OP-TEE boot stack.
ABIs always come with maintenance burdens, especially the custom ones
we have in this case.

Since we started from scratch for the open source boot stack, the
motivation is to keep the TZ ABI minimal and that too with
discoverable OP-TEE services like the PAS service.

-Sumit
