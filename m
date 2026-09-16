Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BA03546D6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571080; cv=none; b=iFP9FFuZBsM/Q4hY3FAkJ2Qt7UEJ1E2JdlbbT2S2Iz8hDvdb/WFtGS+QSJDBMqaL803uDkAYpazvCN9daWwjI36A0OL5Htlj5OnC68OjJmvTdlxu8dnOe3Vib4Hz4QUm02TnZRBIyG5kbkJiIq4sYRUv8GwytZ7+wn/joomctPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571080; c=relaxed/simple;
	bh=ML8IQx6cSEJ7UmK5TI1ede2WcTMV4WWb3D3JvR8a5UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNKxNKHOeKjyg7abz7DqY+SUvbKRL3Ij4+7hF69Qp8nLyTvPrCCKwYY45eGV4zgsH19DOQFwjjaXpE0+vprucdgZk+U5G6XmmuURjWeetEDXrfweMVdSZJM8xVYDnqnbudVOCqkVPoS8SSj5t1RNTMOeIiFC1glO6IovPwSGZ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSREmy6Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEoyiMO9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSREmy6Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEoyiMO9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYVsN2279307
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=; b=gSREmy6QqGpa8K7X
	UoHtXEl4UlTysmQ6XSkMpmktbB5VACXhXK6Jxt3+m9XEjOMbRzfqi/Q+MZxuGfuQ
	WDfs/DXmRS/U2QNfrkrKwTIBXsxKxDwAtEapz15N6i2+jxl3H5jkwu8y4X4wuugg
	nA7gi+d3KkPACOOaFAblt/J/tRYn1iB9yJcNVmpfZAvQV77lk++6bIPP0vyl3eRK
	a/s3RxaacqxmgVA+0HvoNWU43di4OHoZK69lGhFIxdwPW0Sg39j2y4f4py189hd3
	KeDYAtFrOm91idxKU/t8Cr4a4Mo0RvcqgXF1Qj9yUOYO/aSZXvIGH/SwbafsRkSd
	TNtwxg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnrusk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:04:38 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45f00527132so3542186fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789571077; x=1790175877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=;
        b=WEoyiMO9VYQsARtL97m9LuQFC1ySnNdHbo82TXuRWyT+299adBCJztPBW92TsHci/+
         r4QDCgu3/WIGclkju3uEYqqNaafNInd7HLXUJxZOjJwE3zQgJdpR7tHFKKBOmD3+m0T3
         YuH0uOWLEp/0pN/kXGvLGl2QUmjHSQMuCcAYWlYReGYWfJBr/xq7GksgqMS5NyTkwuz2
         EbhGqC5d0OqkufOG4urkZd3Lk9zJCi6xMq9ddnPDsuFNghB4UVRnWSJfksDtpfH54wTk
         Kflz2wRK3E8hrm0aQC6N7TC/5cujFkrDurTp5G/0TDqwqPLl0TCiEPYvY3sNUVMZuTZo
         zpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571077; x=1790175877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=;
        b=SkRJUx4/i/Q1HLorRjjoLra2ULQWSSzZDr34EGWCeMuxN4b1ieJuhvhNK51LrxnMll
         KY2SCCa54qL9K0OYv8ycsCC7+35gEOg7MTqRcpzMJTsRXvyycPKaHTaOgrQkdN7lFVN5
         to+YvPSBucpOGetKZ+I5NvwjvF6q76EdiiJrHS8WgdwAF760h7NEQzHt907gRQ9xHrzt
         Rb/KITC1sE/Nt1M+zpHYvIUSKRCJunyhbhldynMm3b8UyKNGu7+MOChdGi4JNStp44KB
         Jhufc19t8ZxalOtKUPH+uGWU66Jjk9I3zYb6fZnOqgOUjXq8cZmkQh7+L6cCV6hBHrpg
         AfKg==
X-Forwarded-Encrypted: i=1; AKwUvBwJGDo9zz/XN6yawnouZj+0hLe2BQN/i6VJUji1sZoqLXetKj9nJdmA4/TDb1/QAHkaYFGTruW6wXo9LFs=@vger.kernel.org
X-Gm-Message-State: AFuF++lS5Fi2Mk2Y+7i1FOcyarYmGLJmLxiTv+MdRdh2BxnT4m1PBWAm
	k+SzHaY43/0KvVND4Qd7hmpPatWA1kbW5D4Wuu7MaOcYgTvWUW9n1ggLvmGhkjfmdg7WiBh+QwB
	d8MKZUyDPZit5uTex4wPTRTFHJ03+sMX9/d+B/RLK8OZyp34MeITwJRv60e4VMAIOsRU=
X-Gm-Gg: AYBFou0RdXJAVqJAKTYBqo4CZB7JLzB0lqld0tuJD50zvwq3+yqHu7StWWCLsagRpWg
	Zdk5beQAsOUxui5dfPGNSejwnT23LtPtZAskEd4O8sHjpIjamj/FTP8etbiZJsyfbIptIfczRz3
	4E5HiUw4L3pbCQWmFf6nSpDU4ac9n6SW7tG/OlqfRsxGf1/+LUmBScwesblkmmYy460Igm4X1nu
	zA5YgCcmArHDDM5qcZg1TALPhNvtg6t66mHSCdWuzcmArIGG3tZlO5aAYbHksrOm+g60CgToTD4
	cUBbdtwyOjDaDLGwBj5oAlTqx8I1KKUKGppOE0XuW6RiN20YvgJSV3B/vBh/1nVmFQoFtVghNMy
	nb57UWGV9qx6rJy/hJ+Z6NA==
X-Received: by 2002:a05:6808:1906:b0:4c3:bc5a:e0d with SMTP id 5614622812f47-4ca4df328a4mr3029974b6e.4.1789571077195;
        Wed, 16 Sep 2026 08:04:37 -0700 (PDT)
X-Received: by 2002:a05:6808:1906:b0:4c3:bc5a:e0d with SMTP id 5614622812f47-4ca4df328a4mr3029913b6e.4.1789571076552;
        Wed, 16 Sep 2026 08:04:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29e801cdfesm111025266b.58.2026.09.16.08.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:04:35 -0700 (PDT)
Message-ID: <6dcb0b11-3490-4254-b86c-a1afbcd3b863@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
 <EcOn_d45L85SEZXEL9tJYp8j2B3-IIn5Ao1OiDaZsoJZOhfDjo04cEbn_YvY3I0eidZYm2PvZNw0K2e9D62CGQ==@protonmail.internalid>
 <2f950735-91ef-4e43-a5e3-1375585dc43d@oss.qualcomm.com>
 <8c82ffbe-748a-49f2-aa52-eb7a56165c03@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8c82ffbe-748a-49f2-aa52-eb7a56165c03@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TvQGavad127oTUJNzFUSvxl1O_YabLn-
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aaab006 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=UOiVvvBnbk-lCBhJZBQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfX+iQLuMnMM2qO
 36XDe1mo2koeRDMxIy3xAdAGg1Lr8lAkbCYrCFqz6wwbR543/ROepkUPQgfGer1coZO6oShKI9H
 0KJOzbQHXyYz8B/bmQo7sr7VvlExp9jRa5wO0IJ+fVEhS7AwX+jI+VYjrTs4Vfqih1CYdInIk6O
 Pq4CKG1zVAGCUMwPtlwysxCipBUXHuIbW84mg10lQb4wHF3S+KLB59pg3fspPLXNUQZXILQaFnI
 bEPDmqlF7154UaSxZMqclwLvwlv6gDZNTv+ZVzFu7p6I2KsdNfk7zP/s1M5Afibknr3JUn2rodj
 GEOS6FDo4mYK8BsDyrLyNxyjufxsx4vLbmfMdn31yLafC+UxFGJX7srCECZzYq5dBIeshtVjRyP
 geknYSmOHzdNGD4/u64zR0J7/DZNzgKIHf5XM2iBC+t27TcS3tHi66jHD8J8PGt3mUKRVSOs7eL
 bmYaeXd3qkq69kp3C0A==
X-Proofpoint-GUID: TvQGavad127oTUJNzFUSvxl1O_YabLn-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfX4Cx7we5v+fsf
 m1KorgoCiNAc+PyP9amZRxLmHVu3FNB3yzyPL/JajgK9UvoqQvQ38y4Abx3vZijA8IzkRb9QFTc
 k2uCp+Mn411YXUl9h2HpoPKm31uyrOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160204

On 9/16/26 4:58 PM, Bryan O'Donoghue wrote:
> On 09/09/2026 13:43, Konrad Dybcio wrote:
>>> +        port@3 {
>>> +            camss_csiphy4_inep: endpoint {
>>> +                data-lanes = <1 2 3 4>;
>>> +                remote-endpoint = <&csiphy4_out_ep>;
>>> +            };
>>> +        };
>> This port should be defined in the SoC DTSI
> 
> 20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org
> 
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                };
> +
> +                port@3 {
> +                    reg = <3>;
> +                };
> +            };
> 
> I don't understand your ask.

I didn't notice it was. Even more so then, add a label to that
port and override the node's contents through a reference like
so:

&camss_csiphy4_port3 {
	....
};

Perhaps moving the endpoint label and definition there too would
make sense, i.e.

-- hamoa.dtsi
ports {
	#address-cells = <1>;
	#size-cells = <0>;

	port@0 {
		reg = <0>;

		camss_csiphy4_inep: endpoint {
		};
	};

	...
};


-- x1-crd.dtsi
&camss_csiphy4_inep {
	...
};

The current approach is super fragile and relies on the developer
never making any typos. DTC will enforce the existence of the
label at compile-time if you follow the approach I suggested.

Konrad
