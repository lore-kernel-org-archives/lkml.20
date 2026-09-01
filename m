Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC9470E99
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256501; cv=none; b=BBHsVgX3EMjlme8UlVDYkeIpZS15O373+wNngejcNNSj0VyjUBoxuf1XwIUp83S88rEYUqcwGgVYTWg+UtiLb+73uW0lgoN6bnsUKNmdiDrKXd9YvQIXx63ndfqTpjs62is9coe5uPIZ3VrbuDedt4qiTmeYGD2njf/FAmerM2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256501; c=relaxed/simple;
	bh=aqTx+S7mshxuBbBdKgQ5CtXuCc2qvNYpagvsr0pk6Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgPymthxODBvMCfWCkb7p4E6aGA/WKOsOaj7igfUDJt0XDm4xYyA1qxf3bhpuqRGtn2uUmbs7ZOADyZXBiuXy9C/Nn3lmJc6DQCSvqKnLcllC03c/8WaGC+9Gem/CuGP69/PX8Lc53+pF7+mXDD/16SImR88L+Du/mJ7HEPNBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFMV54XW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnzA1X6e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFMV54XW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnzA1X6e"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179QMD1811491
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLFLzCTnod+0cKWMNOkucUdWpp2/XKB75rkTGpsWY3k=; b=DFMV54XWK56mGXde
	2ZYukS7rpdABxgRYXB9l1+MCK/QkIvyGVbwkpE7Q/JXBe/7+7BIDLiPVWibp6ujZ
	EPgO2sHganB/FmWSPsIsvHZ+mzkCCRQjcjjAw7nntXf9DyDZ84atno3qKdeIf64a
	CHvUrQZLRnVa7Jr5PYSFadNVRFz0o/mETFmbmOcXWCdma87H5sCaPeWtmtMtUhAn
	KQEQ+hLV4q38GqBL+GVzRyHuIz5/5NkKOilRYs1+4ZUgmZnQmofUGuakww3JXG2u
	RoqPikhDDqQrqSiGzcZamwaRglpEDChb/Wu/S5c0asY5y12igfIZFoGjlcd2OzTm
	HqFK0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dv6x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:54:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so93711185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256498; x=1788861298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLFLzCTnod+0cKWMNOkucUdWpp2/XKB75rkTGpsWY3k=;
        b=SnzA1X6eqvyBr8e1QwwacuzBooND1MiNBqEv1mwlXwJQCnrN6kvhZIjv8SrePhlirT
         ZQBDUH/85u6s0n6FAoRMoCibnVnrfJD1WuaBT/5IzRy9qKb7W25NpP8Eay6f+KqySWcZ
         kSEWng51RkOEJXd5CoVyXeGULV95kg534ElLvYtuYmCpInPx+weUglxuym66jIBtDXU/
         9xK4DZpZ3I/cNZy6NtFvvNjAjVubeZm4t9WZ5ZG/9jJ2/m+oEACwygUDCEcOEqTPCm3b
         /xGeBJImLGoRXeWGF3i2fOGmE8ocBnF8tuz6qp+dKdCI5UFt/jF+xXdCwgyKAQGRxcut
         XeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256498; x=1788861298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLFLzCTnod+0cKWMNOkucUdWpp2/XKB75rkTGpsWY3k=;
        b=NRKeVL07+veY4tanocuNTeJwJx4KybAQE6vLGpo8CSVZZTjGrt6PIzqMFsQO69Tdcx
         AkaNz6x55pxZWfieQW+FKPTjWKcCa2+2JmWb05KaqaJvCzccMXo74vPpn0uQEBkE0pyh
         SNXBJCM3vZupSJZUqi4DFMujmB80vTLXcoHvF/G3IasR1VH9BqfWJqJDPHk6NkNcjYa3
         0UcHuQix6KGostQDK1QYfGgfTKoLJDDGIHLrqa4OnUI5/EAYkHdqAfJDxwaorT4pk1Ji
         cDG0NRZEvyAilIJ5qoVf+tVXII9Do0nWGArZhbgHIPuUJ4gcz34o64aUuVoKl0M6VKW9
         f1yQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGo9hlSXdF2SaaTKVeo0nw3VKgL7rjYUYhVSnE/o4R0NnC7DXC/4emm2TNAyVSSiQ7uBmwRd0BgPFVigg=@vger.kernel.org
X-Gm-Message-State: AFuF++kjzYIXqsvNi3ZiHF2mSopvMhqvQ25I1vrGaY0W1xFiEL+lnFZ+
	xHkaGjFWh2NhkRl4/wIqiodra2inxf6jdPIVOuFXW8z1QyZWpTqwGsYROMM7XV5JBu9hDDDU0Vn
	zXZ6ibztH6k3tD2Erp/4oXZ6DSwLDUGwNlhfjfQy3COoNIBx2XA2D9N9mVVHmARhcVz5EtVNfBN
	U=
X-Gm-Gg: AR+sD13S+Mkc86nvVFoE0yzq+X/wnOzil/Ykk46k45dJwmZ5zuRAp7Qx4XGNG7VNL0S
	TcsXB9OcB3PkU4cHxGe/4lm4IT+ZRXS2Veg9XfN0qEErmIYji9GsFQM9AbUEzIyr+e1OqqlWkm1
	STupLvfi/vE0V005wpPnHrNgtDv0sRgdF8tUDF+gB+j8aDO8wDuifZ4F7fPzZr3SCHaj0G+CjhK
	7iMyPrdBhyRbrA7tI9rp67S47Np3YUWZds1ae+bvdmyTwzugddbwEL86N6OoY+PXpdohEccY251
	Ndgjh1LP5BrtOwFCuYnM3ZMkH3uoMkomT7KlUag7hvWrhG7t1bzr8ISja6hSBmh2+hiHv+nFuB+
	GromQzjkgoGjzK45upGli3g==
X-Received: by 2002:a05:620a:1a2a:b0:939:17ec:8a81 with SMTP id af79cd13be357-9392879009emr1329688685a.3.1788256498235;
        Tue, 01 Sep 2026 02:54:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a2a:b0:939:17ec:8a81 with SMTP id af79cd13be357-9392879009emr1329686385a.3.1788256497692;
        Tue, 01 Sep 2026 02:54:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25ab2f9aa6sm193944666b.35.2026.09.01.02.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:54:56 -0700 (PDT)
Message-ID: <e1b7e953-2372-41d4-84cf-cd2fbc54f88a@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:54:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: Avoid double-free of PM domain list
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, praveen.talari@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a96a0f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5Qeq7Wt-fVvOjBGoxIkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX5ICBylwUoWtH
 kwkTczdQLGRn0nd8OLX2yazyfJ+PMwtp8vTbVpX5FS5NQkYBmJeNJceqtUNcI1xV3jgNfoA0Mrx
 kc79HM5k8CZJkqy/Mhpk8wB5OAKzf1NpUMn1kTrO1Y8O1jkRi7DY9vFmHgkCnFZ9fgPjMaIMsRi
 er2sdzwTQiHv1in3Fb5RNJQ2070YWLC4wE374z/M+1oV0K1hvZ6pbxB3NK2v9bkFEU6AqSp47Lw
 owr3+0NJd4Aelf7wOOnCWEwxGpEeyHq3iAEgbQGOoIpqDSW3XIllgnrkehvkN9FSienhFjI73ZY
 Lpfbzo/n0cQLEEDjOgq61sHD6spD14HYwRXuEZbbcsDbZXy0hDoOxNWcrEiUdNOreo6wTMGAJrU
 oPyZDKvMVrKu3R5HhWrO1wQeQuHweIJun5ZseE1U4vIdvz/cdWT6ttapODZWLf9MY054d2pI8tC
 NUDSa5jarAdYAHYpi8w==
X-Proofpoint-GUID: uVJEgJ8O9BYKFHE07uYR78f16zdH3-Ky
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX636BI6nYhkZP
 Nos7/KGhia9UuuqHwRBRA8rsp02wlvX/YjZqOZjVUrXKcGF1j65f8PhT3L6Ryb9LBIkNQAwq10P
 Zl+LyVRYs3dYwF6EFeod5QZBlulo5io=
X-Proofpoint-ORIG-GUID: uVJEgJ8O9BYKFHE07uYR78f16zdH3-Ky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010087

On 9/1/26 11:50 AM, Aniket Randive wrote:
> The SA8255P UART variants attach PM domains through
> devm_pm_domain_attach_list(), which registers a devres cleanup action
> to detach and free the PM domain list automatically on probe failure
> or device removal.
> 
> Remove the manual dev_pm_domain_detach_list() calls from the probe
> error path and remove callback. These calls can operate on memory
> that has already been freed by the devres-managed cleanup, resulting
> in a potential double-free. Also remove the unused pm_domain.h header.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
