Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799A38734A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419633; cv=none; b=Toy+PKKzxtsf1gEAAS5vKurWr74F0WU1nGtVrRHlMR6liMFodOxYIDzRLrKucyPQOLJ8O/Vd+xTEZ6XBqUoMQlmOvycbak95ZkyoL5MVkNw8oaZh13HVX7285dDjTXcWzwG+Q7YxB2+Dx5H/l0FP9RRZXGBPj+8oua4nngZfecA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419633; c=relaxed/simple;
	bh=CvFmbia3F+M8TdZTi0OKy/W/j30H2oa04JwaJ3sFhDU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGxwqt9TlzFhgC3XnXVgI1MIJdqbIxcqJmONZud3eKoCmH9JT6V0LoWE4zbW4kIq6ixSmLmOt6nkb+4MORGG8IPY9idnPObSfepI3xuEtrU/UXIdzCYll39022J/QMvqBGwuBjYzogxMXJ8wJ8ToI8cwva/G+9mULXDr0O52TCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADqzTKda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3SD73rn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADqzTKda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3SD73rn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYS5K844229
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAYEJxdeFjAwVE5L3W7h6pCWtSz8H6kR2tHLO5oA3V8=; b=ADqzTKdaK1WkT0OO
	CUcqr5Mq88hxvRB1ZxCocDO92SEb/w5sRiOWWdgG/KyIvF+kSvDr0iNN1pe6XL0M
	/61AhcKgIbDw6Hc2H9LSpm8fPQJH4aIS4OycV8d3v+koSlh4f5fJTCsRAGf9kZ7N
	uITo0CHQYtotv8qpKt3CTFafGIPsiCXcodB3lQhsXWJDjhSqqxbnpZ/46tCilJhp
	n5ZoCgX0/kScPmCJZEaTzf6U3kJRYr2yEp4+kPFQZYYKPWH2/o3GwZRTx3r2W62+
	9Zk47d7IV7SF7rnRjC7icOQ0yXZdlLlVAExAFABmr0PkB5kpitVHF0R6ghWUyrMi
	yYHdkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f32k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:00:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94f086fedso51065315ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789419630; x=1790024430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZAYEJxdeFjAwVE5L3W7h6pCWtSz8H6kR2tHLO5oA3V8=;
        b=D3SD73rnZYU62whGPNq4vziTi8zKJqwqLiDMWLk1r0eW6dbS3RQAE7YPJiZr9445Sm
         /NtQW9vwaFp78NPfxsBs4mhuX0PvGRYpNaoVt1WZ3VN+Fk1xj2WjLA27WH/ka8isW91M
         C1PV6Br2HZvqbKhm8eeYWdbStnsC/85E9LPg5bgT0Nw0a8iLIif5r8XsCD7Zh4xZOuBW
         kJ82ZXzDzJYYvXSo1yI2iBCcsyOtT5yMd+HzI9q9Z4uXCU5XKqSqc+ljshno0EB1w6SV
         wdwW1fQQIPsZC0YleKlC+THT+34i7Ys1v9n4e3f3bgfQGJNOJzVG14gNDPYIIRX9kQfi
         4zKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789419630; x=1790024430;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAYEJxdeFjAwVE5L3W7h6pCWtSz8H6kR2tHLO5oA3V8=;
        b=Ie7X/8NKLPs4rB5bWNjbKkXC6e9hpdqWw3lmtl8EDT/3xNT6JQm+c09GQeUPF73/WZ
         yrJBaeUeJEdyQgYDBsbW5LpkZmBzEj7Fgj+Nhb8MUa6uITKQncXLJPnSSkq8puL33mAO
         VXX8+e73oWoJNSQNl7zJCODRow37KvqsprnAP4gU7qnErecu4Co4CxAX64bAZhfGkO6Z
         rd/kysFZiDN0IGlTsBj6aG7ZNakeGm+iaQ1Qzjii2Tfm5A9zDHjuR0xKmoU+1BmnDJUd
         QEascBAMoNrXmT74fY2WO7nYs3bEtQoqYo35z3Mht350go1ezPgSjhOYgxIBer+4YAeu
         oCvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYHsX1VNtiJ5bSD0Sgjzmp4bdUxAKpGz8Y4got9gGOHkCILUNNY4oftzVd0qXx34LMrqGE0HOwyKdBTAo=@vger.kernel.org
X-Gm-Message-State: AFuF++n4utkPqIuxjDNO01pTNtxysLD2d5kFL97ZPi9IqhLehS95H5Wu
	B5al9piQdGBmpQEchMiXOQrl1da4ogrKtVNoKRlpfOQCZ+WXjHYbaG+KKIy/wlIwHRmWEcgJ/iu
	gSYEip8g/KC8NWvK/0IVuWhbfO9/bAkMhQlbELRimFl3fnPy+rBxRE/RNjlwNxfMJZok=
X-Gm-Gg: AYBFou1xFo12QuVdOoN2xQnIBqHVP5OdLOcM0WjKtX5bwI1QnQ2eNdwH3yVTApYWQwG
	zKIKgkMH6zqHY/DnF8MguOHU00zpGi7rN6a+69FwMEgVRzT1iUzgQEIk+7syobSG8R+myG4CInc
	L6NhLJBR0Zk1KShgYucxE2q1OBC30IWda5aDvtD4q9+yYozS6nGNxVRJw7GDHPfN3W8uw9UBOMA
	KC25JMA0oK+I0DKZX81OIzbvl9epyofRYvm2zR9PtBvHY5BGYI5xkcQykLVDx5OFB+aEiM+6bg2
	XPIvjdAinmyk8eeSZgrEdSWwuXNQ1SxyYkv3Ra1+BZIGoA+bnx5F/8MvkOCySC+ikC+sjCkUWUK
	gz+mZEFouVDYWsnYJEfJguyRppFg=
X-Received: by 2002:a17:902:e801:b0:2db:331b:e187 with SMTP id d9443c01a7336-2dd6c5f3c7fmr81467545ad.8.1789419629477;
        Mon, 14 Sep 2026 14:00:29 -0700 (PDT)
X-Received: by 2002:a17:902:e801:b0:2db:331b:e187 with SMTP id d9443c01a7336-2dd6c5f3c7fmr81465905ad.8.1789419628575;
        Mon, 14 Sep 2026 14:00:28 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm30638408eec.3.2026.09.14.14.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:00:28 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:00:24 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
Message-ID: <20260914140024.00002024@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-8-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-8-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2tG5z2lt3vaTzURDnbUZheTG4LwWev5B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDMwMCBTYWx0ZWRfX1rGFiHTYb8z6
 woOJvSii7yumIKKd8rs3ciHeFd7ObeGE8V8NzjONHmENTR2lJr/wuafXz+kh0Pa6OJ6G+F5p9jp
 fVLJGE3d/gfrYDKnX72CoKDu/KftT6U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDMwMCBTYWx0ZWRfX9HS/2YcqSz4f
 rBJ1jrIU5mwLNs5mDXiR5XyElkbNseQ+ZfL+oM4uOZIrR9TqfT2sS/3OQQggByRXAvtxv02HWmO
 1pRxi8hGjfJCFy4zILGwysetAwCFK8FRK47K/ldMOHlnO/kIqY5wtUfC1BAO00xX5PPgbSB3Od0
 eiAU0RM2IqaDvJExK8WdqQfAtm1UTnrq+kGmbkb3XbtwkSuGuv5nRJ+DAdvysfmMAlCLMegarPF
 u8wqzxaHPC8M7+CPlKlaVsgPrZXen57jlChVeOrLqZIcsnDs0DU6C7mEth9k/XKleqa484bNoy2
 xuH8S+hnhbheaoI9lajWeepJczOIY3vC6wqfyhLvfyvebltkJgqkuYycDzGeJOS6C+WQVwleh/7
 Po55D1z5LzdkldbPp2iWxMTp+OqWbqspbmm9kY2QCO0UDkBgTbcLJoxKZqKyNNub6X0IqvLnnC8
 MdF9mcCUqIMnzbcvBYw==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa8606e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8
 a=JfrnYn6hAAAA:8 a=RSa_GfCpIaWGdN_FLdYA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 2tG5z2lt3vaTzURDnbUZheTG4LwWev5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140300

On Mon, 14 Sep 2026 11:35:11 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The SMCCC firmware driver now creates the arm-smccc platform device and
> instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
> The arm64-specific arm-cca-dev platform device stub is therefore no longer
> needed.
> 
> However, userspace has used the arm-cca-dev platform device to detect Arm
> CCA Realm guests [1]. Removing it without a replacement would break that
> detection and would also leave userspace depending on kernel device-model
> details.
> 
> Add /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI
> for detecting whether the kernel is running as an Arm CCA Realm guest. The
> file returns 1 in Realm world and 0 otherwise, similar to the existing s390
> /sys/firmware/uv/prot_virt_guest interface for protected virtualization
> guests.
> 
> Remove the dummy arm-cca-dev registration now that userspace has a
> dedicated CCA Realm guest indicator, and document the new ABI in
> Documentation/ABI/testing/sysfs-firmware-cca.

My gut feeling would be to split this in to the new stuff in first patch
and the removal in second. That would make a revert simpler should it
turn out that someone has userspace that will actually notice and can't
be easily updated.  I'm not that bothered though as it will be your problem
not mine (hopefully!) ;)

> 
> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com

Could make that a link tag.
 Link: https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com #[1]
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
One trivial thing inline.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  Documentation/ABI/testing/sysfs-firmware-cca | 10 +++++
>  drivers/firmware/arm_rmm/rsi.c               | 42 +++++++++++++++-----
>  2 files changed, 42 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca
> 
> diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
> new file mode 100644
> index 000000000000..bf177d636b92
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-firmware-cca
> @@ -0,0 +1,10 @@
> +What:		/sys/firmware/cca/realm_guest
> +Date:		May 2026
> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> +Description:	Read-only. Indicates whether the kernel is running as an
> +		Arm Confidential Compute Architecture (CCA) Realm guest.
> +
> +		The value is one of:
> +
> +		0: the kernel is not running as a Realm guest
> +		1: the kernel is running as a Realm guest
> diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
> index 2dd69febedbd..52f40256bd78 100644
> --- a/drivers/firmware/arm_rmm/rsi.c
> +++ b/drivers/firmware/arm_rmm/rsi.c

> +static const struct attribute *cca_realm_attrs[] = {
> +	&cca_realm_guest.attr,
> +	NULL,

Given we don't want anything added after this, no comma ideally.

>  };

