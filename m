Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFB5377A93
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851810; cv=none; b=YgGYg+ErEmKT140JVla/riYZRrWm9o7hJhU5A//jdYVmChmOFIc/1nsSg1LXImChAKQ2bDOj1zxGQurOtdYpFDaybROXMccY0rxFUNF0CttGhl+OSYKEkrDt7MMOu85o/VoLFraz/D7BQ+9E6FeFzvqB6Xcoh8bAtedT0mpS0o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851810; c=relaxed/simple;
	bh=K+hdO8YwXvoHzemyeTOvyXNZZ9I8D6Bcyg+siZx5aqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1jL9yJjLVPG+2GOEBUEi7tIh149Hv8M73akLJURhQ0VwuXH9Cnv+rJve0oGO7GwH0Ul6QqUzdoCz8IYP55Hhd2rLdfUKDyMRi53GtLB2za0NBlHXZ6/q3rQI+r0IgbJc8zcsLpR7GefxO7QtVnADLAccx79rAdxwu28J/ZI+vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1+wkkgi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHjzZ6we; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1+wkkgi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHjzZ6we"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LfdN1477277
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q2Waas48tG26JkySLVN0ajTL
	Dsc6klnVI0Z2H492f5I=; b=e1+wkkgi3gpSEkCQ2/2tzYO3A4cRJ/mqHshaMCph
	R9LQlsu4y5f2aNbo+AsckJWWRT++vmg9PnM64cfq9Q5wroKDZPaN/wKBlXa2rT/6
	FhY72oBCHb67q7p/SexSuE1xFARj6VTO5EQY9eHhXHN2vbYc0Mlzq7EBMud5SyFA
	sHB8tNkiJMcE8ELkKElq2snXDFL5lMQkOuFeZuqg3M1XNWmyoYZVjXf17mepxHQ3
	RS46/NxRpdeiYaNeTv2CEFlmSF0GLxUwS4rwJ52hIH1mBvuZlcFob3AfmXdGVCaI
	YiNNuHYf/pxAgMyFflPn+wwAAWruSJZtPTpS8+87UoYmwg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjgpv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:16:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so745046385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851806; x=1789456606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q2Waas48tG26JkySLVN0ajTLDsc6klnVI0Z2H492f5I=;
        b=eHjzZ6we2/6gJhe2NEIMhmMSeFruTF+2PkUj7/JQJRJgMtQaQyiI4VxMK6QYdLmqS/
         2nJJQYW+FpXe1Y2nncBmUwxEcJlfQyUjJ5Eno03UFd+qGzDjpVRwVfleF4/iMYg/l/Y9
         0sv+MNbZvTKbKN+W7bBxczUKVMNuGKUPpa1mxj6QXZyCxkTurBiLRoi1G5DBPq1yauBM
         FxxVqc+GRvD0NFTQwvbxgrHtYmg8voWnwJTE3uOsLsyDJ5+wswhrpgdcOlgMtiLgtMjf
         WPszBqid+YCU1pSUcC4dfg6/Knf/9gS1FosG8LyAt49otHAXPy3s58GG8UDM7ZP1begk
         BZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851806; x=1789456606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2Waas48tG26JkySLVN0ajTLDsc6klnVI0Z2H492f5I=;
        b=Ag0KJ35tvOYRP83Vxm+VikVI8amfvanuB7NgeebTAEbd3tWpFRKiBZTtxCvSEU2ddX
         5OR2pCgmWW3nUBxj1gDODrESe7hgP5ONmZbcP+eZzYcRzpkZtYiUVI6T5KKh67DV1/1/
         78nD/GBkHd06ft5rAaNeaqmjzoezrtB4XthNoa057Nr9auz1DwJaKom77hRByKDoaOoa
         1UmkxXGH8eXXwu2cgGccMcgvkXM3IPUDkO0+Ej37nk+vw0Cz/VqSdPJbKSaJEu/aSmvs
         v4VL7c339TpKy7RADt21j0+BpnICyFUMawazPoDlGeLw6vArQ71zK8r+Fu/C2M00nCpJ
         fcrA==
X-Forwarded-Encrypted: i=1; AKwUvBwn81n/robMAOn1N/RBJkGnvN0nejjE/XRVxkTmCAsKuskjLzqvPrSWYjMb4KxvfLF61N9uWnukWnYr9ww=@vger.kernel.org
X-Gm-Message-State: AFuF++m5OJkCjo2QwnU53DGfXv/9BYr5zit312l6kXPpJ4g0ybZvxsUr
	2+G/0LbhvQCyaOuOgGT1OMH0sKgytg9nTZ9a1yTNTVHFXFHgoiwBEVneKnsaefo4rPm7D+pKuNB
	sDGTlojWXzFvQPxV9/9v+orAoQoVgK4v3S4EIACqosptHY/5N7DAovyIctRJJDJYnYx0=
X-Gm-Gg: AYBFou3vIXCWtE3WSXfcBVDTeKIBFfChaZ6jHOK9XcTzJcszoyFJh+CIUL/6bmcbsVO
	Q2yON0DAme6lP6mR0SjdMfSix+eGZ44/HVePhgQou98fT8e8RcpPzsGQClaTt0xY60jDOUYaXTQ
	qUfHqH+WJ6zWP9VZjPb9MNCVLgfEm9pbBwK6VkZSFYeOBXPX2RuVblip19ZmGvFtEdIFk3Mo71z
	l0gkXsFiKetAPfQuRUChwWCsEddL6RHitAY9E2Sk7hnawrlzN+ameoZwyvoShJG9ZUD+LG/FImn
	kn+ymE0c6fTyo3VddtYdX7h0y3jK0f/p9OBk2IrjqmR+SzGmqwkn6SVwcf3FBskq7iY+jRQDmSb
	Weni3o777aVU=
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr3025284685a.14.1788851806181;
        Tue, 08 Sep 2026 00:16:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr3025278685a.14.1788851805448;
        Tue, 08 Sep 2026 00:16:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm268894755e9.8.2026.09.08.00.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:16:44 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:16:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Message-ID: <sfdujw5phslyh4mornf4gii3tmlri64vrzh3atf3gar724dnmb@b7gwv6npuor7>
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
 <20260907-pixel3-camera-v9-2-b1981f2d3291@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-pixel3-camera-v9-2-b1981f2d3291@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX+U5AcQJRfZO4
 2Or0i14QoC+HsEFjebbPguoG+qG/Acw0j+RpIptgW6Faks8MJpIfMI/B5z5TyGh6MW88QBF1xV5
 sbgCT3M+2df/O01QNzF+OdZWlf3OX8I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX7DYzm7W5ilzS
 PDIsYC6/pVNrZwzEnJgZe7/LHjDIVzwuVSPEvop24Da55GKe8aqomrCX6AKllwyDtUddVIhgWHn
 6ZaEWgVYjL2s2PSYL/lTkpCENdyaFa0jf9WBJUxbW7zTkQJy8AOSA46TTfUGW/VasujqZGC7jHr
 veVUvfOrGsmAr0YGQkfjSDA5JSaIqtHh9V/9AbJO7WXQFQovxFbxABhuKWhfSsrRWkhq2+PTv4s
 wxEJxGEeigBER7XVjFmDP3ni1Q0FLu3h/QSpg3kjBNcPS7WwvVELCufA6+sCdunPpDde3qNDj6o
 YEi+7xMLQvtOhniDG7um2DQHcJSDaV/ttGSgdX11D5mcw+mdyc8rJDFi0PdsL5n33x7MMil2a69
 TEfNG0ICtfcseZeDwYgE+paMGinxEEIH09z+UQ8oEPOITX8pSBnr1OTYLNFwU3qgp+gdROFp3d5
 sDOvr+rZ3V+nT65zRWA==
X-Proofpoint-ORIG-GUID: wwHgOgM65nMfpCqM8b9dW3hMD09pTFg7
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fb65f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TWkwOYXMJnNHLyErFSkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: wwHgOgM65nMfpCqM8b9dW3hMD09pTFg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 26-09-07 17:58:10, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe two white flash LEDs
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> In contrary to downstream, we can control both LEDs separately.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
