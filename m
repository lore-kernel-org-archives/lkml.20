Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471017;
	b=P6luG+9V2JCS+X5dw6XdvEq4xJeYIjPuIh67tqJg7fB0HcYrJ8tE9pI9IA/cNRpTrORv
	 wI5HjuaA+H8m2c25GB/m8yxJHy9Z+DnTZABBbPme7GxL+ryvVhEsr1XE4P5u19g5stOZK
	 46Tsunaer0W2Xa6ZRhpamyOo3vKGACR5aYO+h7XOOcenyhV/93teJb1iKHEbTRfCvwZ+6
	 HxFc07gkUq5zj04vhKWzED619yikpky/nC8wGPy8JTJmVDTuVFetsFwjMfEz3taMFrafD
	 5NRUTmR8a4KiDUZEbuDawMmsE7Rjv02RcKjGQMLXltIJJphwokIg6XRve1QM+miQupg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8TjqoQE8ZgKZIWSYbiau/lZyYWLzMLF76Z8htBhrfbY=;
	b=aJ6+c+704xDQ1JbVWnhe3kPKkLs6M6MQjKfCB/zTxTON7AzpK6fQtVhsvG6afKABZBf2
	 VFNpQ3nUqdqp+PhFY6oISjYesDdrMj1HlfPpjbo/DChWnakCbl1TXcyPlp/D+6J/fofIZ
	 zP9mm8XwvrW7TZw46w8F8qP+L72XjrC2i2B2xeoQaC70dtkyJR1PoIfZ7FNuZhIeqS/Sl
	 J4mFfEzUienXGIGxuo2PPl7WxZHLzda0Lr5tZ6RBVVRG331HVY4p0d4Lk57qpjFVNVNIg
	 yLXKNUEaRmPGoaKv8woKdji0+z6zq2ADXLc0GZMd/Cat7bbgWYjtk4C0XGdQas5NeGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WokwvbsH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQU3PTXZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAAA606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FAAA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WokwvbsH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQU3PTXZ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zgsn4149474
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8TjqoQE8ZgKZIWSYbiau/lZy
	YWLzMLF76Z8htBhrfbY=; b=WokwvbsH1PR8baxit+jPs6pBI8sdEjx4amIjmfRj
	aN852ZUPqzrKubTBc1k/g+R5Z/o86ZHeTSQzaEm+8d9AhckvOLmiX9oYaloVA2gU
	Q6yUyvdWx9unn4b6dn4Hy3vEXu8EQAl7/nIAp60roXI9E4LDT9qByNW37BDiCZ+q
	56njf8g93ed/R2P+GHzq0vtXWzdENAjecsXo3FRULvVnEvvU+qsiGwb3AC0gl6JB
	YDAMXxw8ZdXIn3pzui8cquKE1NTPwuH2KWwDhsCsihvdgqkPMt6LnXr7iUsMm83l
	YkDh5x8ptH0sZY5uBOn3dUrQA6cusdZ9784XNR0pxEtK+g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62f7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:10:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso5788129c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794471015; x=1795075815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TjqoQE8ZgKZIWSYbiau/lZyYWLzMLF76Z8htBhrfbY=;
        b=GQU3PTXZxNfWolrzaXUT441XlnusybumsSIVtlqjzIj0jqj/RxtnjCsPvgzEhOcVZH
         oVgI4kC2AUpLGoWgHpAHN8o9N2cbVygjjBGIRloYqOfrRwDpBZUG99n/QRHBcvMPe7MH
         qcu4xFij+UpK2InGaNXO5xyKAvAKHc/taP2zehyWXNQC1hqIICW/XWUpMhGeE20sgxyb
         9WArQgSy6PruEhsSO5n8UrjyNk0U54bbDL06jmdhRgPagStHMxQXs4pr2ZOFOvPehn/8
         7dGGm5NDdLOXcVVQ/4BDlZji6gcwluYkcgtaNcWzRorMU3kgt0/UdmrLU8Vcbb3vd+GR
         gMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471015; x=1795075815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TjqoQE8ZgKZIWSYbiau/lZyYWLzMLF76Z8htBhrfbY=;
        b=KZ1+37RoAtesCvTOLn/2U00MMApbj+cQNCE8QIOhdP89mQwE3Y9NSPGmwdhq+twsH1
         V2BoELQCIMbN9jLqudwsmtl8TARCcd+s6m0IWiFtTa9y4PsZSUMRWDRVOpfZ+cbgfvRF
         flUndPmyJg918S6VAMvdhzISg15VM4pAf1qvRjDdLXqnnoAPE7OkZsKtIifZ+Rjy0MKP
         mEYTngKrL787X0IJzKazPpC4jW0KKqlg0c2ASDUs5aNgbzfpnFlI0yn9f+NPVQZbdYan
         SRRknSLPOSPSjvXcY/Wc24yNseshh5/p3t9rb4i2bFsv6AhWp1qk7hYT7fswoz5vBZ3k
         /Maw==
X-Forwarded-Encrypted: i=1; AL+hErGcWM5DP0LHAXff/eSVS+gfaFgBGP1PvSP+KNeJstg+oeM6Wm3tfAOy2H1MJHFne33448qaRuYSS8o4SEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z++P5WMXfOZfIHDwCpVN2TDd/AOOouw6HjbJRrukMlOKVXJa4DV
	ZjfJAUy1jCd+HHixDv0fqcNsTA7WRHd88Yqog6ySBlFuca0F2BYCC5SwB+AEEiUPK3PF765Avts
	3CCZrqq1OMqmiWDiSEjTgKdIEMpnJcu/n47bhlZzs38n8wBKPNnkPgRHeVCsEF7CW64c=
X-Gm-Gg: AYBFou2KfQJjKuaoUJFaiZ+tv8RsszrEyUiDlDpHzSp2X1i/JZ49VvK7suCcqwz/+Ke
	OhnsrKK6IbCwQMEAY8gd5n6oe/QPKM47bwXh170+r1Qt2/6dlmTzYRlHULgkRJm6SfjiFK9P3Uc
	uRVKM0YhOsEdWMPpt9L/aQwfr2JZn/jhF6T1vCSZcJlXhu3UHroCOLBibqjdFIRG+pq8VDde3G5
	9bnIuEyyrIJ6WAyB2HdeFDuPsesGslnvlYiwGF11psC6piQZS0FQBVlubYjC4Y1nn/F2kR3cIpX
	gnyVkOln9eAGRtk2LoeKA52kVyijicnmnPk9IeDPQOPc14mDoP1bFCokZc5Gy+m95ehg+26c+Ym
	di/CXMf0ueYJyJ1vx1gK5uT/ztJyyKcTb+0jqHf1NwLRzbzx3Jt7UY7OE+g2wyjxzsMPrd5a4da
	j+P05+f0B4Ha6wR1XDOVeBEA==
X-Received: by 2002:a05:701b:2610:b0:199:e38c:29a0 with SMTP id a92af1059eb24-1b3c03390c1mr3894264c88.31.1794471014611;
        Thu, 12 Nov 2026 00:10:14 -0800 (PST)
X-Received: by 2002:a05:701b:2610:b0:199:e38c:29a0 with SMTP id a92af1059eb24-1b3c03390c1mr3894237c88.31.1794471013851;
        Thu, 12 Nov 2026 00:10:13 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm25032270c88.3.2026.11.12.00.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:10:13 -0800 (PST)
Date: Thu, 12 Nov 2026 00:10:11 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        "cros-qcom-dts-watchers@chromium.org" <cros-qcom-dts-watchers@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Message-ID: <avV0Y5dLG0HOD1ny@hu-petche-lv.qualcomm.com>
References: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
 <avUMs981FKk7Kr3a@vbox>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avUMs981FKk7Kr3a@vbox>
X-Proofpoint-ORIG-GUID: h5pOWaqEYGVequ9PcOmHikQefT2AUoT8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX40nLFwvCuvIL
 8DE+be/iydL2m+9oSb6fd3ZkCMTWX2A128dWOPJzeBZyl6dl+b6pn2psa4XwL57lfubHQZc/tUq
 z7wZr4krLYEzuG+8PBs6KEGiMQoayQFLwUPFDP6Aa1kMwXyMQ2KWSxJ4fyi+KNml5J/fUPnlpQb
 oBQmiPW28GyshhiLgge1xmSgQ0OixCwOSmRrxY2fd4ug17CZgWQNOK41cp04iodosf+nMFetRIv
 8qMbrHtQ/LQxJnqrKTOTbX2pjBm4ScRsFoyPe6U5CSG3+SD9oo63Zf+gFKMjZLCDd5p4VVlpfuV
 kCSw7eTcTDwvOyf/3UPt0ZmzQVfjFrNzsjZqWvKzbn1rOAA2zPssQViR4liKbo3x1S3UjBMLeco
 o0gU5x44u8F/VwjzyDk4vT3IK1r7BgJA/YTitkOFUZBxJZh14gQjmOLv90ZqmZ9M6j9sGXpjjrP
 ZWA0eMLz5JtOU/xJ0Ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX1yKZyx0oxGFZ
 fe0Cj//ka+4Vmodu9UBvNFNUl7rJaMYL31PdDgFOq+L5iV+UvYVRRULauQnMzxpB7fWYG0PbQRL
 F2PL15qx0dHeHXap6Xzv4fpb1AWI+bg=
X-Proofpoint-GUID: h5pOWaqEYGVequ9PcOmHikQefT2AUoT8
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af57468 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=AgDNYC_bV-aoH5yzN3IA:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120032

On 26-11-12 01:14:44, Thinh Nguyen wrote:
> > Current policy
> > --------------
> > When the controller node has the "wakeup-source" property, dwc3-qcom
> > calls device_init_wakeup(dev, true). USB is then a system wakeup
> > source by default. Users who do NOT want the system woken up by USB
> > have to disable it:
> > 
> >   echo disabled > /sys/devices/.../<dwc3 device>/power/wakeup
> > 
> > Proposed policy
> > ---------------
> > "wakeup-source" only describes that the controller is capable of
> > waking up the system (see
> > Documentation/devicetree/bindings/power/wakeup-source.txt), so with
> > this patch the driver only marks the device as wakeup capable, and
> > power/wakeup starts out "disabled". Users who NEED USB as a wakeup
> > source have to enable it:
> > 
> >   echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup
> 

Thinh, thanks for reviewing it.

> That won't work in host mode.

At some platforms, USB2 wakeup logic works since there are
USB2 wakeup signal detection logic beyond controller and at SoC level.
For wakeup signal detected by controller, you are right, it needs
to enable controller level wakeup option, eg, WKCN/WKDN at PORTSC.

> dwc->sys_wakeup is read only once in
> dwc3_core_probe(), so enabling wakeup later from sysfs won't reach the
> xhci-plat device, and xhci_suspend() clears the port wake bits. Moving
> the wakeup setup before dwc3_core_probe() won't work either, since
> wakeup is off at that point. The setting needs to be passed to xhci at
> suspend time (perhaps in dwc3_pm_prepare()?).
> 

When talking about whole system wakeup chain for USB:
dwc3 -> xhci-plat -> roothub -> downstream device
it usually depends on user program (per user option), but not bind to
kernel driver, considering some situations that USB device are disconnected
and re-connected, its wakeup option may need to re-set, and one typical
solution is enable wakeup options before system suspend.

> 
> > 
> > Comparison
> > ----------
> >                        Current (default on)       Proposed (default off)
> >                        --------------------       ----------------------
> > Initial power/wakeup   enabled                    disabled
> > User action            write "disabled" if USB    write "enabled" if USB
> >                        wakeup is NOT wanted       wakeup IS wanted
> > Unexpected wakeups     possible (connect,         none unless the user
> >                        disconnect, noise)         opted in
> > Suspend power          higher, even if USB        lower, USB fully powered
> >                        wakeup is never used       off
> > Attached devices on    stay suspended, resume     reset-resumed or
> > resume                 quickly                    re-enumerated
> > 
> > Possible regression
> > -------------------
> 
> This rings my alarm bells for me any time we mention a user behavior
> change or possible regression. Perhaps you can add this to the commit
> message.
> 

Sure.

> > This is a user-visible change for existing platforms. Many Qualcomm
> > arm64 DTs set "wakeup-source" on the USB controller. With this patch:
> > 
> > - USB wakeup stops working until userspace (or a udev rule) writes
> >   "enabled" to the controller's power/wakeup.
> > 
> > - In host mode, because device_may_wakeup() is now false by default,
> 
> This will be the default in host mode for every qcom platform with
> "wakeup-source". Which platforms have you tested?
> 

Yes, it affects all Qcom platforms, that's why I sent RFC patch for it
last week, most probably it have "regression" since it may never
be tested under the situation the PHY is powered down at suspend and
power on at resume, but that kinds of "regression" is the bug we need
to fix, right?

I have tested at Glymur CRD, external ports work (USB3/USB2), but
the port with USB2 Footprint IC (USB2) hard-wired does not work
sometimes, maybe the initial sequence between power-on and suspend/resume
are different, it needs to debug more.

> >   system suspend takes the full power down path in
> >   dwc3_suspend_common() (dwc3_core_exit()). Platforms where this
> >   power down path has not been tested may fail to resume.
> > 
> 

-- 

Thanks,
Peter Chen
