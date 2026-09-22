Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E843DEA3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790117028; cv=none; b=iD7mtS0cjvppJl1xOy06Ye2TH4y2sir4WF1qQBLVbOpayu6qXlzGl91xSld6nNDhj6JloCYZmmPOKo7vDgRgKaey+c/mGtpWeDe+QgsTfyoNeJf+zQcjwpKPnmpKWL2Wzt943+MiYYCx+JQaDQDYLvVhieodPhiAMW7qU1g19eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790117028; c=relaxed/simple;
	bh=TNq7qZv6We95KhCy65nIeyeboOhZEhkFGiez636Srtw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rWJi6mSwl8sW10/Xz2/LBpfu7mGoMGBJvHqvivxwYqP1VjBQdWAOdMbN0NNl2/j+szglC9te1ooksv/mHktVLNSCRe62MK3L8fiMaaGeZ1EZw6E+1yQ8RZDAA3JadxQs6/hdAzDwqh+R62/0s6V9/2a6WwZ1ahTFEn2G6dU7DxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFNcuMXm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fT7FbsEd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFNcuMXm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fT7FbsEd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI76Ds1348912
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kg/OR840iDQhdwyUp7pmwJO/JhoDMeTO5E4K79nehm0=; b=OFNcuMXmh7AGmV10
	knsoRaEgW1DOXMPkqE6axrjTXY+QI16SKZIKboXNKJD8Kc15XTfM8fMpkusI3SQB
	8CH7dzkYILyelxqMjsuIlmXORALfUutonB2Fbs6VKMtVs1roC1vztFKrlov1xzw2
	hXKWqyb3DTdebH1ZTrkH0nzOrORjvr5ikINWS/yib7JiWlHVvjaEGc3nXzWM5Xy5
	MPolplbsyrok+Nnjgow46lGAHmXPvPsy2UkBo7NfGyx9oUoPoIZ1eu4ABfNTyhhl
	IyfCoyKZUh9NeeQ3Wn3tS4pPdM9L3MNv/m2vfUeCK5Npev/TGbIV+aKk4UUutna9
	Mqk5rw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux861dry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:43:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3286d2bac04so292978eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790117022; x=1790721822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Kg/OR840iDQhdwyUp7pmwJO/JhoDMeTO5E4K79nehm0=;
        b=fT7FbsEdEmqJnX1RqP2iKe9U5pPl+2Co6bihfuzUD8rjAOEWbjen3BVZr8XPLk94T+
         4l9HYwD0vwpQQMjN/AGUn2dwlvhnL5cZvIJyH7UIh1MAckvGbOzOOn6D0/ohfpsAWxN7
         etBkYJhr3GyekZgCX19dEpmrvVT4Ip7mWh+J+gGEi+/2/aXAqRFXdP5lpbcu16dTi0Xj
         HAD7awJ1f9doqcJeySK3djlBV6vAmzY5Y3wb6SoZn6pCQARrunOl8eGmMzg+znE3jGHX
         /xw9pgnq7oP2dEjF8ORDbK4ChM53IDUYrBqlB2w5htdWYw8Z0zcvnfbhQS27z/tGNuYr
         vvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117022; x=1790721822;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kg/OR840iDQhdwyUp7pmwJO/JhoDMeTO5E4K79nehm0=;
        b=IUN+qD07TMOrITfLWeQOaIMw8iT91XIAskCXAQvJRoe/A2yW7Z3HEeUI1ClCHdYc/u
         VJx51nIMB3WmLtCqbUUrCaoGEmeNL5hAb3UL5XlvEfrFV2SwO/yFVJU0foBBm1y/lydH
         bj+31wuOObrhJfEBPn7O5XSsMuRn8i5yGQkdOB+LnTeiMz3Vw3I4iTpEZIQwL2llrKkl
         oV7xTPHQITH9z2KHSNAzmztIW0WtjfoaUflWAD0VXBgi9kc8T4EZLCO4NHuQYY49NM85
         l/xaUE9Odpx+o4vCi6Gra6KE5P9CtjxXNpjXdLc9C4JKuUrPewoiLmq6qHR8T3Hj/cp+
         rxXw==
X-Forwarded-Encrypted: i=1; AKwUvByZIEAC3P3VF1vAwoevJAvapXEZ/gJJbHsdQ99u6OPuj/4w9lQvPgbKWS6MJUzxbxGQHPqH8MgvhiZoweY=@vger.kernel.org
X-Gm-Message-State: AFuF++ni+GYSKHn+FPi0QEtPggmCSizQSsxBrJcIKifFW+C+cmTvPzxJ
	t/T74Z6aBTeVaoMMa/WTlhbv5tHP6Z1MPzFd0dFV7v4sM0S9cSHPe1/+qhMtFAUD6O1ZFJY3Lu0
	nx69BaJGU30CpfM035UNbQ1r9wojz5Vlq3b3msxPRUCFmadSHM7LBF6nXP4gfoYzuZ5c=
X-Gm-Gg: AYBFou0ZeDR2c7/JbswRIIYiy60GRFE0gJF3LtAkuVgw3voTaIA6APwQpzmMDBBosiH
	BB5mjyJBi6Pujhx7HsLr5RLIzezPVO2Nk1uk2DQ+OCF3B87ZMkruAzrFXCQikxephjbBwKjX+O+
	3npKNrAOSNb0Wc1Mjg2ghLG62yX9Ktgm05vcL8L0X+uDbOwZQRBdjsMsvWn8xUoh/M0GNZO0ubj
	wDcYn375FiCRsbdVsZ1ia0gRaVgTaHMJnm+IfwiQcNs6f8+HgAxbga4Ojb9lk434pqfvU7NHu0o
	E8WI4ZxwAp2YNX0oJEzrOznb7DnJ4am2pbgkJjVLjBH4so+Uh8HrqYxeO4FPTLz1m4plLTfjbjz
	mES6CcOhoISLP7Un1vfz31UMP/8sqxhSkwYO893XRSzPOuqJpran3bA==
X-Received: by 2002:a05:693c:638c:20b0:33e:3f5b:3ff6 with SMTP id 5a478bee46e88-33e8ca260d7mr785960eec.18.1790117021774;
        Tue, 22 Sep 2026 15:43:41 -0700 (PDT)
X-Received: by 2002:a05:693c:638c:20b0:33e:3f5b:3ff6 with SMTP id 5a478bee46e88-33e8ca260d7mr785932eec.18.1790117021259;
        Tue, 22 Sep 2026 15:43:41 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258978sm1124102eec.14.2026.09.22.15.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:43:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:43:37 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 12/20] KVM: arm64: CCA: Add a new mode for
 supporting Realm guests
Message-ID: <20260922154337.0000762f@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-13-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-13-suzuki.poulose@arm.com>
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
X-Proofpoint-GUID: uUJpl_ydzIr8cYFeKQKzJtxdQuhinLAk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX1oi0GhFdrUbn
 lqCnxJimqcDVCJen0vE5+kt61Jz9H+CFu26XM75wHwNuwBkNVN3EZ0Pa0dgwjiZeeeR+WLcKEvl
 RUqdwqUEp7DcrilPhlp+oMrZihSMl98=
X-Proofpoint-ORIG-GUID: uUJpl_ydzIr8cYFeKQKzJtxdQuhinLAk
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3049e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=btJ7bRNyUFryZYO5LPIA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX087mloEnr8N2
 Or/iS59q5sbrJFqoS2feSSCdFTtXzcGSKeEpC49HuWOd/8dcd2VHXGnLS4KmROx4UOZiMqmLkBD
 vPre3szCz7B4t1XyOxS+8bwymp8fuQkieX5N7ugA8CFrPJiwg0c+BdvO7tdyBf+6A56K4oDwj+d
 rBvdGBAU4Kd5ohT6BckjrU5u+D5qAU8Hsf+jiXNW5BMsE8tu9NV0miRkgOoJoqaNfQ1ICf+tuky
 X/PsmRWKtix+mfr9zpUoORX8M7LJhQEs74RMX1EfvGQLxkfMz/qfaK36P6c6che7LOQAeodMZcT
 n5piu8m7+HcsE0erZGx1Qh0Ic/uoc23ZLuyrpgxAQSA1lKyqzRxWyfcCG3+l+t85qWqRj8wBX2U
 P2/CnzKMAZPiSPnJ1InyDIllsIXjGpxMFYhSmQcqDiL03DcZvqPFwuGgPwhYXuXNqcrRgPDF2ju
 AyeodM+VqCFG9VQHhlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303

On Sun, 20 Sep 2026 22:28:37 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Add an explicit mode to support Arm CCA guests.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
FWIW given how simple this is
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Mostly given so I don't read it in v20 :)

Jonathan
