Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB08B472092
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932973; cv=none; b=shS4cEfPSOzhaIN1oE62KQ6QZG0BWSSKUT5JVvQdWT0otapAOVGbGBr7UOlTwrB4Hkv2zilFCLoggsK+kr6iAgsJ7Thzy4DQrKbQ0/TSEEHNI6dfBrYR1vd78PpZuUvsXenL77SEW0nearJg9yEA4q7nCtAnd9cMkj1t1xXtl2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932973; c=relaxed/simple;
	bh=4SJLPX+kwQBXDmR7raZp5aqQUkMqAt7w1SUMljxgVVQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kn29Z01vVLH2NZPvSiQu+UiOQx8dHYVowYxsowFTyzF2bwfoDm2N2kLwwYpq/PCI4on8v3Q7s/aC8WSbxbp1rJe23rc3Oae4mG+9CIrgv086vPxlMVvKLHmQOKBfebWd4lXTKWWivD7aKlB/Zj5JYEk8s8sG64T4qMNIR0IDr1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZchkmoI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kc7pKufg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZchkmoI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kc7pKufg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j6d9437909
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 09:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=; b=WZchkmoIHU+qjvdF
	/Z4KPTEmCXryerWgvQ5fMse1US/iYI3wSkEpZRyO9WGoPqieh/8rC8ZVWMQR53lr
	vVUFk2iL9fQeVLXDEmpuSo2Js7cVYiLeHQqNpb43C20c5ZUmXn2YarQfNNEkG68t
	+7SQlclilqHXNy9DFUlBTX1FjK5EJXg4SQcaCzFuK26QOVxPZ0AbXZP7oWjPQD0T
	01n7maRnfDajUkzt6JUfyhrzIJ+C0DdXjqnhRFMAOXFoHjGtujKRYPlcgJxlaRpz
	HFuP6osAGmZzvF542wWwco6DJXMEycU3I/dZwr3M6huYJgtvbMSyVIwZTtx1OfDV
	dEaXfA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdcku7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:22:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a6f6af95beso281065a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932967; x=1791537767; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=;
        b=Kc7pKufg74oIfgvAJldkn4Vu09YOiiM+rIXlaNAhqHzs2B1OalEjdn45OJmV7jQP5C
         fzCKn4GqYIjcHQfbqogdp9XdJnG2m1n9WyGMf4gGJPAmCPUHASUedlGza0DFOrgL98Gq
         Xwzps2BZVboEj6hoaFVN2NppUE0hxkCSJeeZumPQbf7IBmUP5U/tLazDNX6HtAGs0ZeK
         Zr6Qt4rQuCJzJcO6bbwxxa73cAaUwYdRIyp1fxIfcbWdar8PkzXUvfESRTnHPHRxA26m
         bCxgiy/KwRCKxKUzce8QM+z9SNxfncVZcCwiyk2Ge7AR9iHkcn8DcKKOl5Xh2kphufWV
         Awfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932967; x=1791537767;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=;
        b=2XMHLEcKV79UjDK66k/BLmx6wbT9K+66gW6F2xStUMLQCa1bVqfHbvNiplUvXXNWo2
         VDPTIjwDPFHOThLynVZ3Ck0+rpDfWFJSnZTRcnSO6krNkvBgMX+AFVkOC/ild4TIkL0a
         78bXXzCvWnvR8GFMEKkB2/uZEztbuLNhCX9mze5lOpeelzaiyUHrjBUzG4WokcpqtlrK
         1Gu18jXUMlHNhTzEmQsbu9eUJ94Qf84ttO0tO7ZM1EuH68MbqCL8oPEP5eQe07opy7Ej
         Qbbnr243gXT4unEeXqziLXd3NZW42s/jhJgaubRBSFkWHYmhdyWvRXAwpWEW5JC7p12W
         01lA==
X-Forwarded-Encrypted: i=1; AKwUvBwS5+IcKL6mpny7QHeoD/ocaavFRcrQJqvmiuK3NjDK5GeUA7opdrX4tsV8yX8N2M0TGfb0+VhmTjwK9uA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLPVcl7mptJFEmVEGi5/ClsZ6WWWvFdeYeCLIgnYq+ip6lZKKE
	tYDfUIJUTUXVj1icubTsQEGC3k3PQlgbSVEvc4cDl/kTK2Pa5Ow6+ri4bs9Jg0Vm12J7d0mRzCQ
	CD9PN1Qt/gdz9lofPINOvLQwbN0oqeREz5nnKMjWib44EUSGSqVDslwzKF1O0LoDiFY0=
X-Gm-Gg: AYBFou13PXHadGNfk0yZHRCMMPXFrhoNIfWNwxzo5PV+EfFa5Q+uNuwX08Q9xCHuzMw
	aSlErDzSEjBd3FaIAQ7z4M1UXp5UUvR4WL6KxKbWDrZMP7ObPfbwhCKnIAaxT1nV2WY9nosqXpP
	8CENXX2MDfP6MRXHBVPIyhBBakFto7uwYHiJfPHoIzpH13bQLt51hAyOFLAGLr4EWoqPWmVddqA
	xJo5K6wTWLWdTWepeVuxGJECZzMpaWkypOqk/G2sLyT+INoRudVaQS+LAGUFm7+8WwtoVc/JBta
	/eV+YHCTBitV0uOsFadEiNY80mrdNCL3LjoF6PajJ1qR/EnGeJDkq2O3rUoyhPLZrZKAgGrnuEA
	AN3uJAVxYUtFY
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a6cec7cd2fmr1834291a91.61.1790932966358;
        Fri, 02 Oct 2026 02:22:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a6cec7cd2fmr1834240a91.61.1790932965653;
        Fri, 02 Oct 2026 02:22:45 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ee4bc6d7sm616096a91.3.2026.10.02.02.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:22:44 -0700 (PDT)
Date: Fri, 02 Oct 2026 05:22:41 -0400
Message-ID: <2f143e2e0698daa43191ff3463e604d2.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: "rkrcmar@qti.qualcomm.com" <rkrcmar@qti.qualcomm.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
In-Reply-To: <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
 <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
 <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: BdrZ1h8PKMTyIsFdWbUKrJUPn8cC1iEG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX9n+/G6bsL45t
 TMIuVFkbZXK429mRLlwSm33YyQNaCZNXHIZrcXChAKJGghrxxdymuub5frK59mywOFuueSttd9z
 0+eIXI8HiruIyEE2mUxH+VcdSmU+xeg=
X-Proofpoint-GUID: BdrZ1h8PKMTyIsFdWbUKrJUPn8cC1iEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX5W8P6dvRj/4M
 h9E7gBJ2zCgpOynNCi7IHTylT1S9lnyjBrZ2bs1SCzoucq4F6WFuV6WzpHNSQDCW5SmHQcRtmZz
 irOfsD02j5BN79rxqp2Xic3lQtWm0ZwvbUda88o45S37FWym7yMkZVi0oGhQsp4CHLMb1nfu0zm
 74x2f1CrDYmHV2UA2Sk0wSFv+02mcInexsCZnTDDtF9o2lm2tMCXQT8sm29gi6EJZqsYCbwG3oR
 a1PiYC0xQ+1TnAsHVO899sXCvsXbcf1FzkBfBuep5XLymbk5ZefV5PssmNG0KVlUMaWTXginj5E
 L1+23WP+fdOzP4xDjZvCs/ysP594rhhJ5lzr7zYHew1fAdnC9q5G8N1irPqcJ3txkut3FZaUBYm
 FgtazGa7DE8yqyq6pQ34Us70T5HIc7K/8wmBxES//AkMJjYjfN6Mg8h64xkyNrzuw4GsIYLsBu9
 0J02+JA+XjhxvEMfXiA==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abf77e9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=xvfqbYfxAAAA:20
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=iwpyHwDBbu1AC0YlxIwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020037

Hi Radim,

On Tue, 29 Sep 2026 15:12:36 +0000, Radim Krcmar wrote:
> Are we sure that B will always be listed in the ISA string when Zba,
> Zbb, and Zbs are present?

For DT, yes. The binding requires b whenever zba, zbb and zbs are
listed, since commit 0cdb7fc1879b ("dt-bindings: riscv: Add B ISA
extension description").

For ACPI there is no such check. But B is a ratified RVI extension
and RVA23U64 lists it as mandatory [1], so any serious hardware vendor
should respect it. Right?

If the firmware does not advertise B, why should the kernel correct that
for them? This came up in v2 [2], and maybe here I should quote what Conor
said in [3], which I agree with:

" Part of me wants to know why we should be going to a bunch of effort
  to cover up for inaccurate devicetrees etc. Garbage in -> garbage out
  and let them keep the pieces."

[1] https://github.com/riscv/riscv-profiles/releases/tag/rva23-rvb23-ratified
[2] https://lore.kernel.org/linux-riscv/CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com/
[3] https://lore.kernel.org/all/20260604-decency-salaried-4cb69e1c9fa9@spud/

Guodong
