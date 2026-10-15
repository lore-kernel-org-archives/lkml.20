Received: from outbound.ms.icloud.com (ms-2003l-snip4-6.eps.apple.com [57.103.72.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA30598C14
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098412; cv=none; b=R3oTOOA4mwFyrr021ik2Dyzlg8L0npbZ+mOAifzsqxvl3wcGufoLck7kX8zIrOZ8FkhN/Ludz8vS3hD7jnh2ZPZkLu55ioZ08KtpVpLraE/LlvCAaL84DFoMlFLp3chmcduehDIMJfXe3BWW0GaBBo+lO/FDzOq5NgJactYqhXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098412; c=relaxed/simple;
	bh=cw+ZciOM/Zh5UZ7epV0ft165OYMA5eoxuBEHRGg8zuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opBH1DHtT7OqFz+kkVUAJx44seso75UPcbBz/Xzmt3XfdFYuboTtqAqtbeAc4UfdQBSyaKQV+P5AuCzcBAjwq4yAZOciFeDje9ZtmF9iZegM2pxKiGnucCkBRlsYLv2R432oTsDcQY2vfAE8C7pRzUUtNbxqCwvA7A2HchBgaOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dxdmail.cc; spf=pass smtp.mailfrom=dxdmail.cc; dkim=pass (2048-bit key) header.d=dxdmail.cc header.i=@dxdmail.cc header.b=l0a427PO; arc=none smtp.client-ip=57.103.72.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dxdmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dxdmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dxdmail.cc header.i=@dxdmail.cc header.b="l0a427PO"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-10 (Postfix) with ESMTPS id 84B8C1800AA6;
	Thu, 15 Oct 2026 21:06:47 +0000 (UTC)
X-ICL-RepId: 01a14163-946a-7fa7-8e9b-ff7bc069bca8
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQFBHV8DXhxCDFYCXAFLVxQEFlIOXx9yFEEcXgxeBxwTWlhVCQoPShRUGVoBGQhRUEsbDlwHS1oVVRcOAkIfUB9MFldDWhgcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKD0oUVBlaARkIUVBUEVdQCw0FElhMV1hWRgIVARseWQZcVl1YSVUJGl5QRVxLCl9TDQVBWDhXFVMGUxlVVlAOCUtGCUkdDg5CGEYfVCdXAloKWx4=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxdmail.cc; s=sig1; t=1792098407; x=1823634407; bh=gVHjhLKFFbXqvMPHTigVPXemFzaUWGqDm1RN8g5Xla4=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=l0a427POto59cieuo0MsDX37EVFKzmud3anCFPAPXcCufPXnqv+duvAySTez7kEeNDIcx/Kcbr/Xr3jHXkirBq/xLR8GVxWFA54nsDP2ybjyUphaS6QxAwP2BPODLOtl1KxJIOnoNb8igDHUJ4Zha/bi9noFUNFly6hI3OkL+HunX3aCwS8SWRe2hDPHQr+90SLWMKs4APjhJHOyUaTKSmwPnl998o7l8p+tpFQJPtDOZlYfW7s+ZqNnH6VfIRfjHuelbePzS23mnesjQ3+N/y9Jtv0BZIJdxBJ30Lmpk70/DtaLhHsMbxHqordSMBhZrA5RlLXJ8RSfNvIiqCT0ZA==
mail-alias-created-date: 1790174225171
Received: from [192.168.178.181] (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-10 (Postfix) with ESMTPSA id 99DA5180009C;
	Thu, 15 Oct 2026 21:06:45 +0000 (UTC)
Message-ID: <f7ba4d5a-0e8c-417d-a1fd-5b5e392df71a@dxdmail.cc>
Date: Thu, 15 Oct 2026 23:06:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Tab S9 Wi-Fi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261005-gts9wifi-dts-v2-0-c3ac9b0f9ceb@dxdmail.cc>
 <20261005-gts9wifi-dts-v2-2-c3ac9b0f9ceb@dxdmail.cc>
 <2e3c1082-e5d0-4a33-ad3f-272dd74aa54c@oss.qualcomm.com>
Content-Language: en-US
From: Nizat Mikayilli <nacht@dxdmail.cc>
In-Reply-To: <2e3c1082-e5d0-4a33-ad3f-272dd74aa54c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA4NCBTYWx0ZWRfXxYxPVDbj5F6q
 hIuyMvf7sE5tzUHnK8wv5cBFCOzmoq82bQt85CQgeCCisoQQogI253ttiLGJqigkV74lvZDwxZg
 kHTzxJjxyqJ1IXOPo1x8JAAi6FC424I7SFdwmeM0UafmiCWS/+UsqNnaGpbKDQrLJaRVq9CWShv
 W3nMMWaaGRWwncJTImKdZkjFImU6mgXTsRSFSIrSZ7wn/X9b4+wUXSJk7RtcYkGn4jp3w1vNBmZ
 D1cqcfASRbOCHNyQYR9uVidXwu8KZ5DdK+RGkuoWnRCUJoAVRqpYxYVbJ8o2hF0G1cZHeLNFvOi
 0uqGnhOc9wxpzM8uYoRz0Tc0Dg+gVjhjr/SysWJFRj/MihYuuq0scitKZqCm3w=
X-Proofpoint-GUID: i-eSx3hQpl3ATRtatVz-2CWXBhx7ojEl
X-Proofpoint-ORIG-GUID: i-eSx3hQpl3ATRtatVz-2CWXBhx7ojEl
X-Authority-Info-Out: v=2.4 cv=PquergM3 c=1 sm=1 tr=0 ts=6ad14067
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=AqZmfHzJsoaMp3Ki:21 a=IkcTkHD0fZMA:10
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=oy0QN2RhhR1_62MuKjwA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABwh/w2G1mYTvCLaVm+relYnMP8P6MKAWAcAusuaCxkhzxET2HWE9X2cniEi8TKpqmcwZz34700MMG8VgYCHIXZZtBDdj1W002XDcyW6XEvwBahIEejxeG30UlWAbdoiyETcAKs85oEqmXMEF5y+OafGqI1gwkmnJBwC9/KvrJaALFRd9ppQSWqBPiIPcuM3MvG3qLPsJXko754vYIucBYhXBgQmoQZRWJLAyfqWdso34ONeiUIVMRNV2Ya6COOXhGA2C3sB4w9UXgfd7ZYc/nAOxIG/VE2csuG5beg3Lp8bJbl6Q9EZQ/9yO8nEr4EBnA8Zft9fxrz+ykUeK3iXSA2IOFBi1MYTIL7AfHMsjAg8KoxxoqVC0LooDApPd4W4CTglCn8EZvgY26Omws//uiiEvHGwO1Bn/iAAZUzNjUVrUh+Rj4zVw0TnL1uh8YumAn3SaEtAPSH7EtSAUWQ6UDy/Nji16Dm+saoX+Je22pkQHiDi7YbIvJ+nLRwz/oZ+RYBB7PRJIruoWb5AAiUhY6DDyuen5Xku8PcPgviKlmS6AiNEZYGUtfXqf8aZY/aU7dfX0CQBqId7QVomsV4reuxk0IdxPedXhT/9bKMnuW+6LrpfKfPH9IQzpTX+8UVSWJWmfDop154isyp+7BXjY4hl8WAkpXT4yGcdCEmM/ccrGrsejxT1/m29cQdBCi/FM5uMIvQwOLoKnY9xm5Df34cvOKI5twv3BL2aD+ovwO81qw9LTIURSpWw/iAtQP7URY0hBPUFUuxVliVr5LDYVKee9gmdYNdifLNIBanQMPqdPz3GCaBfvrFyK16/zfZ5qMcnw5sox+DEIAhmsHJ6EK3nVeZO+zbydWDpAiKewotYsPK4l07PgBx+M2ACDDGtUMOrsCNVmnA3xaf44/IMiVXnO5/C1QlbrEjVjZ54+Pp/5qDRKsjnJCCng9JuVjhDyGn4FA14oUU5Qnej2FdiOdI/K
 gQgwMP1lNqYfGNbeOg3LXYg1qvx6sswEYVooyVapf/5M08MyEgd8f438waLqVZU+1Eu+ztfE7jKnP6nWFE0ZBD8IE6pbsa4w+0kbqeipMYZEIlOLta/ghxqNdVKOkIrbI6jQVa04+08GcQJclnA3Ucyc1PsXR6dMoFdF4q4VaO2/rpuEhIJnoEZXUHrYo/IV5qVsCYUBtEZWBvg61tIQjSZk0cZ3bwcC+QM2aNqAoQvlxaU1R7TVBm/DJrKzA3jOyByFxzXkWTSY15/Qxx4j5XXE1RVupPl3mRXO8/JrpsC1FVKxPaYbUNxsEfcx2p0UKgFP3te3tdoSE1DLABdm8QMovYKQXhxMfvGbk5DjEqiqePSQj

On 10/12/26 4:14 PM, Konrad Dybcio wrote:
> On 10/5/26 9:47 PM, Nizat Mikayilli via B4 Relay wrote:
>> amplifiers and the VA macro probing. The microSD slot is described but
>> not yet tested; audio playback and capture were not exercised.
> 
> Please test them!

Done: microSD works (UHS-I SDR104, read/write verified, card detect
works), and so do speaker playback and DMIC capture. I'll update the
commit message in v3.

>> The display panel, touch, pen digitizer, cameras, battery/charging and
>> the wireless module are not described here; the latter needs additional
>> power sequencing and follows as a separate series.
> 
> Wi-Fi/BT should be a low-hanging fruit, see e.g. sm8550-qrd.dts

I tried a qrd-style description (wcn6855-pmu, PCIe0 with wifi@0, BT on
uart14). From a cold boot the chip doesn't come up: all PMU rails are on
and wlan-en is high, but there's no PCIe link and BT times out.

It works with the same nodes once the 11 WLAN PDC messages from the
downstream qcom,pdc_init_table are sent to AOP over the AOSS QMP during
power-up (tested with a hacked-up pwrseq-qcom-wcn). So this needs a
driver change first, and I'd like to send it separately.

Any preference on how to model that? I'd rather not put the raw strings
in DT, so a table in the driver seems better, but I'm not sure what to
key it on, since other boards don't need it.

>> +&i2c6 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
> 
> nit: let's keep a \n before 'status', file-wide

Will do.

>> +&tlmm {
>> +	/* GPIO36..39 are owned by TrustZone. */
> 
> Do we have an idea as to what they're connected to?

They're the QUP1 SE2 pins, and Samsung's DT reserves exactly these four.
Most likely it's the fingerprint sensor (Egis EL721), which is driven
from a TZ app. I'll mention that in the comment.

>> +/* Without a Type-C controller driver, keep the DWC3 in peripheral mode. */
> 
> Is there no pmic-glink in the firmware?

Doesn't look like it: no battmgr.jsn in the ADSP firmware, and
PMIC_RTR_ADSP_APPS never shows up. Type-C and charging go through an
SM5714 (charger, fuel gauge, PD) and an SM5440 over I2C, neither of
which has an upstream driver yet. I'll update the comment.

Thanks for the review,
Nizat
