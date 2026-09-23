Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D3B5349D6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171150; cv=none; b=bsH2fpOz68W/36oZBJZpxrR/lHwHe/2Bd6oVmADnXrGkVnPXP4NdaUgQ8gzsgIlxIOPsmhhZiq1f4wwaa76v/mbGwnnrxDTgck1bXNI9zj39+Mys5ZO6ZY/BpQD9jl1/dr/uj0fwRqijaOuIjvZ7RowA8Y6MLXLUW2hVoqNtgzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171150; c=relaxed/simple;
	bh=hAUIAJP2KyIPOrXkm/QtyPmhhjrZyPRauTKH3tyreRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkMzRWsUr5TLJxAmM4kapmPLEf7WuNi/usuGmaSSe3HpVKlzlRoN35f1P59El/8K3NYmeF21nLDjJWE8+GiuR2B4BLtPJlSlasTrY2gule7gwgwiVYE3dV3vciDRjhyWpF+11LTjI7fPP1du7qByAbS/fd7WEkSoI9hFVYMgRfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHhZfGyt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDmcghML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHhZfGyt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fDmcghML"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbUrC3027942
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=; b=NHhZfGytzmWFyCsj
	Zbq1+A+FQqTZC64KnzfYTjTVPG4qQ2PppdfaDev7x8JA0PLgl8xEusRGtaUk2Jnu
	dktSsj6AkBdohfO4tO1sewfq6TnnSSJAfWsSJiulrAuLH1YzPMPiVH1eN1YzL+gr
	rXl5tjJO3b9ESRI7PcAkNumaqBIipyJqWDIi7+ikcMskQZRd0A3wRk2DfxasF1it
	2mcq9TNtRWWuNicMFsLObGoyuSiP7WGMx9NrG7MnL3ooMu+9W0VVVhVHfTo5swQf
	RGt6T1OymuOg3EfZA02+riv6lxDfUWyRTWk+mzOgJ+2ZyLA7Gl/eBGkdBvnXp9gg
	Mxdl+Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwas3sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:45:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a760965865so70615137.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790171146; x=1790775946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=;
        b=fDmcghML5Vx4RH/N2Fr1VuCeWYF4xgPjKxuR/8UkN9F8Gev4CYn1n7dhiotNAPl9j8
         1GFXU1vvROPDmy5O9/4Z5nBDDtJ11aQZw8pzN4KFgdJyvfLQXHxqQjW4jeo1I73xdaY4
         0dR+eNdEbQrG6vr/kz8b+vXgLjt5QuTwt0368pIKNrNilL0GclR9z7r6LGmJCO86hJ1u
         1KATXHK/Qv/+HVPntHBylf39KTYji/rDZDJPUHWxgjDPiKouS8UZ6It3cfR04WIN6gdH
         1NYaq2eObkbLanZpV+jaMyb0DD2hzy5jlcBRdwtZsSn+uJo0LNEMNAK4nGnIHR/pPjCG
         ONWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171146; x=1790775946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=;
        b=BHoblgPYPHfjdXGNt/Ua6YAjc9qirntbtL3Y2ktKnsEZyRAxfOehtVCnJjECaHE35Y
         tbioVYhuNcEehZMD+ZtPvxQfAdWJOrFwPJvByl/iQAMCpBtqxIFlUWPsZvLHumzAbYF3
         9YawXjEjqC2j8ad+F/heAoyR0NP5IrIEjU38C1s0Ejyx94gjr8jC/zuITMayZfmhakaa
         bbKFG8CU+dDlE+FAX/Zw2jO5bx4G2E2BXUWfQfyS0S/DlIT8xYOQzdtfn8ZMxGWZkggp
         tXItb0ZSizybuYXfxK/jFCQK1SpVCe0CXc/GrP8NKuU8dH3V9kYvh6k9XPzhto8Aull3
         Nadw==
X-Forwarded-Encrypted: i=1; AKwUvByY9o1NbY4uTr7HFWQLUvRVL61OtodP89q6hV22zeSSguro2dcjUniHYtAqIBAUnII0YE7FwXhk7937v6M=@vger.kernel.org
X-Gm-Message-State: AFuF++ly8+376owQvyHgh+XGjARi52NqC/H1GvOKukFqhbfowhfSwkkL
	BW/9mQmvnrB1RwD/57j23x3klX719ZO3xt0ZOulUidJOvSXp6jU9ulSlcGNwFS60RUM4iAfZLYP
	TOaWUH0zP7Qb0tewfZFP/jysQU4Numpp4XYOT6f0dL3PqNnGoNnb39DKOAfRg6RU5djzHxA7YdE
	A=
X-Gm-Gg: AYBFou0Jf7nUUvDEynS+L1inD4YLg0zFJB6gBSn6hnw6kzU69BxQ83Z25j91+v+4hj9
	ePyRnN88RTmPqbk4kASQr8uJNp0vwoJ36a5uOkBpLSYPQ70+2bXAQQsejnyCUy/hb9rBTPRefeV
	148Ktg407/wnCslrcKXgT20ceRMc0FEPgor/YJqpXYODEvINHUXiiCECI39u/AsKYCiVY9ftpcZ
	0kY+RsU+v9Er6uYaqnRlYBUh0jNZXCw890B2ARXzSXUcpTAySntJqagclksdEpE6IyawwqOVR8L
	kTlL93LMR1IRkLbIKhHjyNt+0nqyhLmUPeaI5wqId56pvQcmEr2HPRu30QvFtuof4CBe+3QF6Ca
	FbevKlyPsM/B1DcpU1THlQA==
X-Received: by 2002:a05:6102:5121:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7ac1c454b57mr2548246137.2.1790171146468;
        Wed, 23 Sep 2026 06:45:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7ac1c454b57mr2548220137.2.1790171145961;
        Wed, 23 Sep 2026 06:45:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37478c9sm1722267a12.0.2026.09.23.06.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:45:44 -0700 (PDT)
Message-ID: <32bceb7e-d06b-4537-9d34-91bfe27f4ff7@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:45:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/16] usb: hub: Associate port@ fwnode with USB port
 device
To: wens@kernel.org
Cc: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-7-wenst@chromium.org>
 <c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com>
 <CAGb2v66c8L20yNNmvj6TaQbS7LnqAyuv0tMQfj+0PSjMUcSByA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGb2v66c8L20yNNmvj6TaQbS7LnqAyuv0tMQfj+0PSjMUcSByA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX3irCR4UIX9vr
 adN2N2cjJiCYhQPhzE6JMkcVfCJKIRdjFdDXA7rdboRWF1isgSerQK4DMLSVljW2vFL+nBG0Hlg
 bbp/bH/tnPtFFBhRvyZGTRVoyHBF+Sxvy+h0WV+cSYfKJzecucAmfzA/YX5df3LmFUbiNkE+rN5
 5u9CVMjU24eoEPFeFgZIMmpPrROmfEapMRcUhqFTlm8qrO3Dv3grf7TTUye6sR3vlEyd3zOzJvx
 ZO7Cw6Nn4yFy4D1CAmWl4awj9IRXkr43xeu8xs3SwGkddpJVyzj0obhHXoewoIl6ufnJ9sfbaFH
 sYTWSK6zZbBYsUQq0nkc3JV8cYVD8sJyTcDFszeU+/c3qqNMKNp6E09fyvVSYwQK8jj5zZjVcGz
 4OZBfTsKVgzvOG1dy5s9w5OjTb0//9iGxtFs1MCAA3mCjSk/7K9B6gJFC0DqdQVeCfP/1iZZRgl
 6hbADOskBb1wsAFc2AA==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3d80b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7ONEjnSaIfHBpTaVFwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: hT9UxFDBC9ktw42zKQRM-ooPaURHWBvx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX5/JBePazGSr3
 xo5lAUQAboVfjNeuRdW+V27pJ/C/kuVbRfDjxqn+xAnfKoEQSTWzY8SzsWYbdCABFUz+3E6l0Pc
 I4Q6PK9dF4tHu4en0mfnhtmgcfYr0bI=
X-Proofpoint-ORIG-GUID: hT9UxFDBC9ktw42zKQRM-ooPaURHWBvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230054

On 9/4/26 12:30 PM, Chen-Yu Tsai wrote:
> (dug this out of my kernel.org email)
> 
> On Fri, Jul 31, 2026 at 10:44 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
>>> When a USB hub port is connected to a connector in a firmware node
>>> graph, the port itself has a node in the graph.

[...]

>> But something I faced when I was poking at USB4 was that dt-bindings
>> currently assume every controller is effectively single-port and the
>> of_graph ports under it represent HS/SS lanes, i.e. the entire
>> "ports" subnode represents a single USB port
> 
> Which controller is this? AFAIK for xHCI hosts there currently is no
> "ports" node specified in the common usb-hcd.yaml binding. I plan to
> add this separately, as it can already be used for USB A connectors.

DWC3, the qcom flavor specifically (qcom,snps-dwc3)

> The kernel maps every downstream port of the root hub to a separate
> node. On the XHCI it is more complicated because it has two root hubs,
> one for HS and one for SS. I'm not familiar with the hardware specifics
> but they seem to map into one common namespace, so you probably get
> ports 1~8 for HS and then 9~12 for SS. Note the number of ports is
> different. This is just an example from my x86 workstation. And on
> x86 each port is mapped to a different ACPI node.
> 
>> I think the solution here would be to do ports {} under the controller
>> and have every one of them have 2 endpoints (for HS and SS
>> respectively) - then, each DT-port would correspond to a USB port
>> (sorta like in the hub case, minus the hubs are split for HS/SS so
>> they have just a single endpoint under each port)
> 
> But the hardware descriptors actually give two ports, one for HS and one
> for SS. And in the case of dwc3, I suspect that they always come with
> one downstream HS port and (optionally) one downstream SS port. So the
> binding is actually correct, except for the numbering.

Ohh yeah I overlooked the HS/SS port split.. I think you're right!

> I'm looking into the dwc3 case. Changing the numbering might actually
> not break anything. Linux seems to just need one *a* graph connection,
> but doesn't care about the number. I looked through some other projects:
> 
> - FreeBSD doesn't use the OF graph for anything
> - U-boot doesn't use the OF graph for USB
> - OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use the
>   OF graph for USB
> - coreboot doesn't use the OF graph for anything
> - Zephyr doesn't support dwc3
> - TF-A doesn't use the OF graph for anything
> - EDK2 doesn't support dwc3 and doesn't support OF graph
> - OP-TEE doesn't support dwc3 and doesn't support OF graph
> 
>> But that comes with a big breakage, as always..
> 
> As I mentioned, it probably isn't as large of a breakage.

That's very welcome for a change! Thanks for checking all of them.

Konrad
