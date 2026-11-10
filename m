Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305935;
	b=vatqZX8c1YUsJCrQWDr4quyz3hu1FBI0qhmc5ggbJ2c4HgI5AfxzEKDPqHa+uCHQAOtJ
	 JqFOhyqZFm2HUZKP8pc7MN3KHm74vjKJdvrYb7b0hMwKQO6JeawTBOeQYhORf5UaaVMaj
	 4D5fXmCuh7qWRGH7fxpbKUug5yNOBFKLCig464eZl+IKuvGQLWGN3QQdrxnptgofznNpJ
	 HyLrDjmF4NZRLvKEh6NiAqCXOBVYdJsXz2k+tfRBIRODu7j4JoC0lLit0dOnUjlE3v3NL
	 IyKq4dQkRvJFSnyDga3Jc6p0FEiQNuRqhbi46owQKdZyViBiZ7uhB+vVVAxbf9fIrsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
	b=FVpOzT3ZjLMOi1rRgfoAeT90boJXxEfrt2bBq1RmqxEteCBY9rEb4+MwmLkz1QfA6aIZ
	 IpUSYW/iXQpCYrUNytkXMB351dQLoJZmBEzAsRxUDXr5nCrmSVYF1Y3YUjFyBTPj2n/+z
	 cxHgB0l/tFlPYXrsBEhfMMc5tNZctcI+t71e0u2y8fSApDIauwK7Z73cuDJJSiuM+g9R4
	 1be/znjhlt31b0i7mqBzXd65myxt4w1VtHKEoAlylps6Pv43cr4uBc62DJzzk0YBBp9Vq
	 YcIyR+G5o3LsdnICsfYwFRt+CYQqyaQT+wHg9lX7aolIvyn2XlSqOLuTZexNrImlwDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xgv2aIeX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W6Noz5wZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED9606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38ED9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xgv2aIeX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W6Noz5wZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l5gi1155050
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I/EFu7Fs/ar
	oypMjEq5BPl5EvpaGvb9lezW04r2LTCE=; b=Xgv2aIeX/aafN7Ei/rMWPqmcw8/
	1xTLyJHBiscFRwYSoOsDxc9RZeUw7seu03C1GVCqSyzLLgRqvzzVuBMaVgNOsaR4
	+A765VBXjklqNTRJPO54YRoR5LrFjdqGAwEmJt3ICm8H0yEAFKOlSYjhDiqCqumy
	IyfycVeSYxFxdTQAUI8ghyh19PeziFnYaWhejUdrSc276ZLEWAqimz37itX3B92t
	vzNe9J+labWkSN7nGVQvRUE1Li+QUcmm+U4IAiJ/3S7f5Q8y02cttfvq28uXTSYF
	hpPG1EWgvRQNQ7UxbDrheFwch+RaQtbtZkjAJkU+12DjRqp0dJCFThgEgMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49n2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:18:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso325299685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794305934; x=1794910734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
        b=W6Noz5wZ0uTArzgsGwSFkXasiWs9TIoT1NGs4nG7QrpTPc5LYjTF2omj8c0/ySJb7R
         oOxus7ekl0zRk3wLZFyR8ulSrjE08PY2AjsftFBtr5PYS9IhQIpUjQ4sxUpIokMIWTeC
         jsT91Jt1nqPWyDZB7Q3RhUDEzJVbhHzaJLr6A1vQs6y4tY30bvnyWVz2oFYstBwG5RwL
         zQztiX4YESOh1RFtRw4MgZ7cPS6qmJvO/0YARoNUANUG4VMIjC9B229VjioBs0oY6YUx
         HwYEzyj6+yazgzglCi3Zt7JxJvLC693dlKdCIC1pG6xWrT1MkGo9SVgkUISj6h7oj7PU
         C5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305934; x=1794910734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
        b=McW+xhIermHH5ghLBwaxeqqIkVyYSWgk8y8zI/TEpACIs55CLsMkyO3NSMBDEzKxzv
         JPDBpjzFHwGYCmZaezMRRLZ0TUolRfeJffn8Jp1dSoGtj0NuNWwg97nUjVSvlhjeIJxI
         dMBlzreRxqHpF27Hb24yY5smKCsWN5sk2yxiXDXuEuwiBcup54JMk2q8lBSJJonsRnqX
         ZAiv0o8PkZExtYAZC31X/vied2XF/n4Zzc2tau31Gf605KqL8sgBsGoMIWzFq9PtXfPq
         qM9OwT67+SxIK7vhsQNlopynzmEzuKVQkpCclHq3srg5/cJtiddlI9h1SwrOa++C3/j2
         MLBg==
X-Forwarded-Encrypted: i=1; AL+hErEsaFX9bnpat1ppwbnDDWGd4RNsfyDv0dYUt4DQXiXhaG1ppD7yfYVicS04WaQy/hrJjVWHlaj1IeLh5W8=@vger.kernel.org
X-Gm-Message-State: APuU4Z91NRujskNdM8zrqc77CaDqtQWTrNKFim2m7+tGtQ+AgupQxo46
	nKI13CtOvbjXeGzT0oWUuWuIARrByczT0Xj1YBPTtwJ5V4Ni5iW7HgcjmEcIpdGh/6PsO7mi7/r
	Mt2YI6C4nP+y3q7jN4MOTtxUsjwyFu25UsmmiMLbwYa/ntmUTUi53Ysu4pVAS8rXSOf0=
X-Gm-Gg: AYBFou22nLEmtkIaFDIVSAy4CU2mtmi6ppnWzBDIuwb+8ZgiFxzAIoF3D0oKF/CLaNV
	C3tZOVxtHShRGDZCzwjeoAqE3jRYjelLZedDPQ5y1Z4o9RI6I2Lx4cXaWgHZRGhk/HLmq1O1RVE
	WhILimrlqaQi43XoPT6IcKXtZhjg7FOtEPUTGS/fD5TwwfL8hWB8e5FtWDIjIC2bWHPhH8rGl56
	/Uf5LvA8EcA5DBZXqZ3cM4sQO876KbLVeJ97o4YuvXbFZhCO+E+Wcu6+A21Inx3wITGdJEtD2LX
	D2e4B8ZjTfw3uxnqC2xa7RRE3RKp6+1L3lOKZSEYGnMTQ5J9YtYCPNTLZYo4+vz5JIc5YQh/3HO
	SLXOhCzU2Us5L6Z/A/RJoTRuO1Zfc64iOEXIChjYrP9FTtyLi7bDMS98/Za3zouO2LJ62idf0tw
	==
X-Received: by 2002:a05:620a:4593:b0:93e:6c4f:bdf1 with SMTP id af79cd13be357-9479f2b062emr334980185a.17.1794305933426;
        Tue, 10 Nov 2026 02:18:53 -0800 (PST)
X-Received: by 2002:a05:620a:4593:b0:93e:6c4f:bdf1 with SMTP id af79cd13be357-9479f2b062emr334976685a.17.1794305932853;
        Tue, 10 Nov 2026 02:18:52 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2f09sm63168165e9.4.2026.11.10.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:18:51 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        loic.poulain@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v7 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Tue, 10 Nov 2026 12:18:49 +0200
Message-Id: <20261110101849.3768125-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106133143.GA2705755-robh@kernel.org>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com> <20261106082522.1448390-2-atanas.filipov@oss.qualcomm.com> <20261106133143.GA2705755-robh@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MCBTYWx0ZWRfX/Vx621UKCsEK
 hsHxXlQqtnfBfZmRDbXJr8CiOBcZYUnf3ZtszAAaq5i+xVaw7wN3Mq3RSqSEnfafObuIVj4QgvX
 sgLyQfJQpEknJCuWUh7CtL6SyOHS37k=
X-Proofpoint-ORIG-GUID: y1sbE7xWx5bLNxxeazoErfiEZ3SLTOQl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MCBTYWx0ZWRfX0mQ6vgGCfRkv
 /bbWrZGscDrSkOFgabPEqr744HtnxJVDqyvsXGG7Jyy6+2OQ37zg3gfNiqMxcF7lYLjTiCqHYRc
 YQtkbIfemJ8I0i5nVpKbgKFsY6z7k1if058uVFAny8NZXvZ0U+Yjs0/Dl1/FIuti5c+QqVocf+e
 kGaajiBMHB1DvafOrtyfqt2+m+jDm+JPbL6Hj6UExN7kHW6pseifAq12ZS8T0vVNVFgfHHVvAc1
 Dmd6+0VOY7RYA4HGO9nv80/+0fzbkdvNzLbvshhRn+wgz57MjweiCo6899yebuFUFtE6/INDyP1
 ufZDBC4UxQi4qIW/BIl1jD+qOiuXbf9JGzHeAxyK1zViyjJ1ugaRKwaa29a7+4H2E1j7/nHrwIP
 l/2VBXJKjFqM7TZXZgcy54jj3EC7ZVvYwZqnd07xhVwNh4J9rrY4U7TUxjsjOgIwIPjuqV3KqYo
 BtWDL6ce9Xjje2cpdDQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2ef8e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=cRrya0eItvTHvl-yL4UA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: y1sbE7xWx5bLNxxeazoErfiEZ3SLTOQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100040

On Fri, Nov 06, 2026 at 07:31:43AM -0600, Rob Herring wrote:
>> +      - const: camnoc_axi
>> +      - const: camnoc_axi_src
>
> These 2 don't sound like clocks that are part of this block. And 'src'
> sounds like the parent clock? Use assigned-clocks for parent clocks (or
> just retrieve the parent from the clk api).

Right, camnoc_axi_src is the parent of camnoc_axi. I will drop it from
the binding in v8.

For the encoder, camnoc_axi alone would be enough, as its memory
traffic goes through the camera NoC. The problem is CAMSS: on SM8250
it sets the rate of camnoc_axi_src directly, and a rate range on
camnoc_axi does not limit that. So the driver keeps its minimum rate
on the parent. In v8 it gets the parent with clk_get_parent(), so DT
does not need the extra clock.

>> +      - const: core
>
> I would expect the main clock for the block to come first in the list,
> not last.

OK, I will move core to the first place in v8.

Thanks,
Atanas
