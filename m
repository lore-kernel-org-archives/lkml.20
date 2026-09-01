Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0095F364028
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258658; cv=pass; b=R4DTKtF24wnR9t+QQ5yF3WMvrHocCiaTETbqWeYeqfhMlMam7qpgppw0Phhay2Rw5cXnuIlLVwZ9SGZwyeF/xfo15mMYnY3NWQ51FMhZdxKGpM/klcLDFw/2rTorHznmtONEVgWY3R2Pjic8ulPX+DMWxQaSXIX25NQ0rJdB76w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258658; c=relaxed/simple;
	bh=lWFns13aUQVRLJ9/uaF4B2fLPnX4BZA6Ycqj2XWx6wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/H8RuwORvav1CBjKah5w8GJ3YYfsYhLGKbLUBFc2b14FB+l3ZdCtwgqKAFe35qvxwF1Jl1axH8IfXFnX7yLhzIDSgKYQd/j/RMe7QygjUB+e68pY0GJEqDWhSnZdnlETZ4/U7q6gfM2Jc4k6+aNqX6M8kDfX1HQQuM+onzwpzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L24pVZ/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yf1enstF; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L24pVZ/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yf1enstF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJCGh3406516
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 10:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=; b=L24pVZ/ZqR3UqxGK
	/67Ss2CEWxRkdLC3ayiyFTGUoXWpcWN4OwFx0jrQtRXWn1FW9W5QfwLgb8KTD0k9
	VXA3inANCmxJRdNG1TdFzjqDC2lkfvvladRHjVG4IrE+z65E9aAnsEQTGw71IFRt
	Cth5Kl1JLNSIKsmyJW5tOWNTFgYA2eaAG7rmiTDyTpYah40uhNhRnI9nNlIapDXx
	tgGkDMaYbMwGfILTDIdpdgjsacyyIgftl8+InQ7uxVvbYahckUBUSTutJog97nUF
	ICuTYp4BAjDzqlVCXHjSMsyWarzJJVoGX2cpKxi1M91rxA81h4lNdrgCFXIrEQUf
	kNHixg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu0yy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:30:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-399311947f6so90391a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258655; cv=none;
        d=google.com; s=arc-20260327;
        b=iYpxYf924ELtxJmLv9KVSExIIv0suiK8W0lZlhqNZExZueLWiBFsbc7BtgWA7gtcqN
         Gf+g99CSIWJFNN7ol9PWd15kqDR7i/92sJZ+tbyXFrKYXYnZCjhvsZIfAanNZ5YvxOE9
         7C7lK0ATirI6WMikvd7dQ+tnN63dvEhW1HGUKk6WZ8K7Gk6ud7cjZooLSDkBUErZZXCa
         3D/CRKJtynYTAvGJ3x2/mQ38zHL6alI4v9QWAIokA79ZezZ20RQ3ld/rL0DIL7vIgSlC
         8DfxPn12aKbAiUpb3to1Ldbf3obj7FDMmyl717YjZMigHnX9OYuE9h3AeXTC5mmiNji0
         6WDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        fh=FC1p6ot/vScchkS7whY+zQOsegjChaelwbFp74W3Few=;
        b=PUjljEMnFoI4MzKU7IwPW91MLXChMJlFE6h4VCX25Nbswcog8GNPaaLOW8ooa9ZXaz
         wjHvrsyUsd/rptdenkXeFsqm5cy9FduhyKtw1+EBnhZt5w9Zav/a3pS9A4GCzkjYUQFc
         fpPAcg/7RAGf4dZimcqpzQ7mlT+BAoM0EAf0nOlp9ahlZHO74jiO71dGl3ppY7agPjzu
         EFSh1psV9FAISqrPW4hzacR8fJh/JO1Nji1RDx9Z4gyGfk56yzJ5iEVCrGrNRtbajor+
         s5QPW5g5c8pDdFiuAXlX7+EqrFLY3zLvE+ZagyRVc/YlrcysUlwuuFnpng/mUwyyY5YP
         is/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258655; x=1788863455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        b=Yf1enstFltFaEyIAG4RbldOd45NOQA/ewgWQeyqamHmtxYPunGR5M1OTxS/ZspOc2n
         z6hWn07RVkty0auiQWSbinTQqHx7p5mGwgtN11hEBw5xtnobSxHsRwyOndpQ6ZFP5YRK
         o5gIcvHVnufAAXMF1qcL2Q+wpCMPWpdoDXMfmFnK/uhpiUPOSNKD0GgzyABO3rP7Gorv
         HxLrd+ct0VEcS274GhjUywr1urEFOavd9nnlQz+W7hjOO254pWfV6ixdhDjajhZjRQF7
         ucGZrMalKwnfVS7hzbLLyGLvuCElLL6OhxzwCvJLv90zOGvODwhMXcBxZXWBsC5J1frc
         WN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258655; x=1788863455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        b=MkOMjHRP11gYYoKt8dduC/A1iuOPkrlTTAehz8ameao7bM5Ihwir0oxqQ5zq+6YDvo
         foUXN04J+vu+Ls4AcC/y+wTC6yHu7RiHyJgs64mKMcS6ztEuhno9wDpSUfCdZ+/un2EA
         /uu57P+84mFaJCukW5P0tSwxgNN+XqPQxnDKYCcLFJWpiTczJwUb5zDBNWEEU32MJzND
         7H5QWxDpwvhrn642nf5eXHBaTN+bbu73m6/sbJffcnoSN7pbbl1cCME1ummawlCjAdN4
         k6JvwEzqojTxX6v2DIrww6MEplLVkjjrvPv7KZQGPfJOlmvLICqNbsIdI5v32Yw4YeGp
         igdA==
X-Forwarded-Encrypted: i=1; AKwUvBwkgvTu+VU/pjPEvIWCMkKPZ00IXWOxdtf5rqSC+O8u9OvEZyEQByxgP1007Kg6D/Siut7BsjQQao6BVVk=@vger.kernel.org
X-Gm-Message-State: AFuF++n9ebZ2RYm1dxBe7q7+Cted2CXWeugDswM4DBb0DLbDkejhbSPG
	nnyWueRLKDyTLqa6bDK65WjIV7kDL7vQcjoI4/JplCk82zguxmLf7eTlEkVfSJmdUnGG+OWAVlx
	YkYg9UZ2b6X2U40BpRyISSA/c4PW8h26cwRiJ4e4eDFzTEpgxpVU4xyr3129Db6asVNrJvYcjqh
	bGAE29dWTE4tZLCo3eqwYniRsmQ8r1oSGJWh84/eZO5uJmtmlz6cxC
X-Gm-Gg: AYBFou0bJas0XK5Xth27D/Uja+W2UHUv3sOyifyAQVvETDi9TdajhEW2SjF/HSYJ7hG
	mRi7zxk+JKDgFHMUFEh1A/IOFQkRMbGkiWYAFh/Zpo73413jeXXrIPyz0XRIh274cyhhcboA38C
	KLhOGMjpwvIPLNEpUuV4qSGenQX0sIVeHdf3tZHaBFXyCRJst0uUvNIK1HHg==
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-396d0ed8eb2mr48338267a91.9.1788258654960;
        Tue, 01 Sep 2026 03:30:54 -0700 (PDT)
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id
 98e67ed59e1d1-396d0ed8eb2mr48338075a91.9.1788258653663; Tue, 01 Sep 2026
 03:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <CAPx+jO9QE_KG8BbfnMLTebDpGDj7OSpPDtgc9uTBGZCDJeLu_w@mail.gmail.com>
 <CAMRc=Mezpj4A7o00C9hhs97kdA5Q+FZKTLRbDM+fR8qr0xCCqw@mail.gmail.com>
 <20260827125906.GJ770273@google.com> <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
In-Reply-To: <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 12:30:42 +0200
X-Gm-Features: AcwNN1UeB9u2F8V9KZ-ekpacU9KYz87Vz22k3R4eoK1r51ZtRDyRbVXuvUd2fmo
Message-ID: <CAPx+jO8XTr-C6gPRWA2t4TVCTdRQ8oquhrfv7vMmC1oV_DpcZA@mail.gmail.com>
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX6If8oWwTKrZK
 rOK+7AClI5rFx0Jgm4BwIrKAXmgSWcv0nf3wHMwPcUOkMcM/iYebuH7uXcFtf1N7lIt8L3E69kE
 4LIALfHLyTNjoLQDHhvhLj7cS1pZajmMYaEy8UEOckf4xeGQPr5Z7x2Af6zFNQlpxHPAWZ278Wj
 z2Du6bs4flydt01RQyaGYIlWiDt9eo8gsyW3BafgJyKU/08FD0ktTIPTcnQcDhO0elQbzoisACS
 lKBsmWlnS1YRbQDZYUn/GgY/iZSjjeij2Cq2RvVN86ksFqjP/C+myVCgZ3lHvEm6l+L1m5/heFj
 HFX6Miaehtc1oL5plPOViqqJ6/kd4v7pMRvdiaepGKQIaco5N1Wpi4pzc8W1djHbsMvIymy1X4s
 H/bnB+IEjZ4ZsgqzJp7cwrJ/WPkPTVo88TqeshpoJtRZW2HV0w7UzcNQUz+6Mr1NN42bhK/e1cV
 vSsZ7IErCNxZ12OsRtw==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96a960 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vprddorpQwRN7yjes_cA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX6l1DNl1UK18r
 MptVyBxlGklXZmdNacY5pWUjV0ahNHrDAgBD8sxDBxYeWbpQ7HWMEMpHAWQOHGAG6WkdKKgMrBU
 t/7icVA+3MJVUbgxR4f2aaR3eujje0o=
X-Proofpoint-ORIG-GUID: j-crQ8v8gAj6TMLvtv80EFO6I6vAf5Aa
X-Proofpoint-GUID: j-crQ8v8gAj6TMLvtv80EFO6I6vAf5Aa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010091

On Tue, Sep 1, 2026 at 10:12=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, 27 Aug 2026 14:59:06 +0200, Lee Jones <lee@kernel.org> said:
> > On Wed, 26 Aug 2026, Bartosz Golaszewski wrote:
> >
> >> On Fri, 21 Aug 2026 14:59:49 +0200, Ulf Hansson
> >> <ulf.hansson@oss.qualcomm.com> said:
> >> > On Mon, Aug 3, 2026 at 11:45=E2=80=AFAM Shivendra Pratap
> >> > <shivendra.pratap@oss.qualcomm.com> wrote:
> >> >>
> >> >> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> >> >> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> >> >> directly to the same PSCI node "arm,psci-1.0". Additional consumers=
, if
> >> >> introduced, would also need to bind in the same way, leading to sev=
eral
> >> >> drivers attached to a single device node.
> >> >>
> >> >> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and regist=
ers
> >> >> PSCI child cells. As the first user, register cpuidle-psci-domain a=
s a
> >> >> child cell.
> >> >
> >> > I don't think PSCI should be modeled as an MFD device with childrens=
.
> >> >
> >> > Instead, this looks rather like a better fit for the auxiliary
> >> > bus/driver. Please consider using that instead.
> >> >
> >>
> >> Hi Uffe!
> >>
> >> Since I was the one to suggest MFD - would you mind providing more arg=
uments
> >> in favor of your preferred option?
> >>
> >> My reasoning for MFD was that it is indeed a device that provides mult=
iple
> >> functionalities, of which cpuidle is not really he main one even thoug=
h it's
> >> currently the only driver binding to this node.
> >>
> >> In any case, we'd need a "core" driver binding to the psci node and wi=
th
> >> multiple auxiliary devices with their own drivers, we'd end up reimple=
menting
> >> MFD.
> >
> > Ulf could be correct.
> >
> > MFD is usually reserved for real devices, whereas the aux is a little
> > more loose.  Please consider it as an option.
> >
>
> My point is: if you start registering auxiliary devices from a "core" pla=
tform
> driver based on real child OF nodes then you're basically re-implementing=
 MFD.
>
> At that point you're better off just using the existing MFD infrastructur=
e.

I think it's as Lee said. MFD is for real devices, while auxiliary is
more suited to split up functionality using multiple drivers.

Kind regards
Uffe
