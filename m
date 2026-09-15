Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF239416859
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466905; cv=none; b=J3ZlpH+vmn8uiVGfdCD2wOmQO9IIn9vo63/VSoumyIcsl0pBlmr9k1yd+EmLsA/Ev6dqai/oWaROjNlmYHxsNnyi/ROR+ckUpLDgYMvvAlA6fv5+gjVMr2KenKR82Xxfm1vAHNw7Q5eb8+qq7Uh6+aiB8i2L7UCPIuaSd7h5IUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466905; c=relaxed/simple;
	bh=r+2I1mt5JUAQH2DibPBlj1jWA1g+boPLEamUKs/RTlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+na0Ii5+ZQIfTbjZn/Ua6VmGWLM4rgiacXDrPjRGHawmiJXS0M2l6fYuiRN+m+ki0sP8YmegL0/ND5AqaDo4DZNqgoy6BSEHUx5Q8lnjPR2JRcuCf6xXYAjFA/vlb1mPJfmoLQk2iXmYhwO1DCH8ssq6MZ2Z5UB+rdRBtDR21A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IEfy15bP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cEGTLxPN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IEfy15bP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cEGTLxPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789466902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4/ooFyjMzxLyQ/E6w/+gsTRY1i8Gt2eVZp+CjucjAlk=;
	b=IEfy15bPXYHpgb/D+fFi8GTHzrhL8Wq5WGKVlfZ+gS2ysAlX5sFBpl2u1o3h7uu5NQt147
	c8CdfGuHFOCJT7kuat+sLrCQVMkcLLwhP9dTRFC7mes2P0SGSWnSUrkB2qgAI6CG3cx/Vl
	c/HZ2GM2oqTQ/bl9CKRS230qQt3/ahg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-aGJRkl_POtOKalKvZyGUAg-1; Tue, 15 Sep 2026 06:08:18 -0400
X-MC-Unique: aGJRkl_POtOKalKvZyGUAg-1
X-Mimecast-MFC-AGG-ID: aGJRkl_POtOKalKvZyGUAg_1789466897
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4843e59c32dso2826779f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789466897; x=1790071697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/ooFyjMzxLyQ/E6w/+gsTRY1i8Gt2eVZp+CjucjAlk=;
        b=cEGTLxPN8MR39DbJ4GGo8Ys5W8TUXof2At9j46P9+UzDcB0RpGJVPONPnOl1mxk8Vw
         hgNvSK0RfpQCVSASfoBBM6clvFcrLaTltJD7j8Ky+atBW+i3dOnZcmjDnZ08TYOPRiE+
         bwlkmvKWxPlXKvWH0iTi6Bd4vEgIVPhS2nGfldSXrMtPbkz1wIretUyML2l1L1GzAXD3
         Jc5gB8yPNvh1bz8Pu0tYpyS/xJGdVHnBEjqX+zIBV2OMd0vWoF47YSAqkQM+OUAKE3kn
         ayePaGManzOrRddL71UzqeLTHtlPAgg2U9tbwNFB76E/+fFBSrf0Ypc4kKuiMsiucu4J
         o8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466897; x=1790071697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/ooFyjMzxLyQ/E6w/+gsTRY1i8Gt2eVZp+CjucjAlk=;
        b=URYtihnwuLwHlBkM96CXA9B+ICb8JBWXz6RcnkVmtlb8ev9WYhyf4XenYyt4/aEEy9
         V7gslSvtHdwM2/QMGx1Bi66p8ovBdr+vD96ja2IAiqs8ymvm5bKEUMRItjGCxjSY2Nrr
         wfxKWA/fXaHOyQJRs1yC6CTB6E3m45BRok8i9nO0c1qtFlyMkaikxvjJ4HaP7orRvKaX
         u/znBA+saQRqJCXYmbJP3p6RJLPLKXgsPPhFjw3Tkvg39356bFTZkWoYHLdXpMUfPSCZ
         NLK79TWFU9KM+h8uIjOnY+Y7bHrbCkuPEpXzqO8YOqmm3NMF9OFqA5Q3Ul32YKQxbFe2
         f5Aw==
X-Forwarded-Encrypted: i=1; AKwUvBw/qrKhC9cazZXzrX7IcZ7CUcwm2xyCojHVT0a3k4iF8ArPmajKBXn5pBhO4omamWrvFYm7mdgxZlfmuOw=@vger.kernel.org
X-Gm-Message-State: AFuF++kncOIOpUWEn2ogqVDXG5VgZfLh5kKEWPKUhPFnE69N30GDp3vh
	oDEbQHWWpnKmqrqXGWQlUHfr6CU6ihGdthBTtLUbX5GllyqR0x/oAZx54kSrOG9Jz/OkDBBjhDL
	G2SDx2o3cR9m9/b7r8tZGLt/J8afLFL4YqRn2NzFqHv87xD3T/V93HeN+VqYx0G80iA==
X-Gm-Gg: AYBFou12xDT4dOHxlte4xXrI4F/xPeMlJ57AsCWOwfMvp9Ss+/mCnxJDxUj3VK+1AV8
	iNF6lkxEsn//8KHah45fCBfTTanTVpEXQgXJ3u+qIrfa6bCl5PRT2hiv9b6YUz2+qPwaDzafcWL
	uflIInFTxRpbOFBFtEVbBDvPZWXsAK6ncOikBzDDAUS+hUCPHU2dS9a4DDNmWd+HviI/6KjMu7A
	g3V+KADOX1LVTQEwQcH+iSwEWhdNm9iuW6TZi16+gaA/54BTzP8n+3gyIdqXyz/FKjVp80QhiTq
	7xoKH3OPvbu1ougcUjAU7sWnXrX2JBOHfzCmZdZr630H4L3Tvcz2E+Y+VZTqnR/MrGFQ6t2VoKE
	JoKOOSLL0lGNVvlXGjtwQ/lvlSbRBtY0j3MaGPjORTmnSDPRvHQWekFMKirEDKR4uQnA4xbJ9/w
	==
X-Received: by 2002:a05:6000:41f1:b0:484:4880:449d with SMTP id ffacd0b85a97d-4870a951e92mr85723f8f.3.1789466896836;
        Tue, 15 Sep 2026 03:08:16 -0700 (PDT)
X-Received: by 2002:a05:6000:41f1:b0:484:4880:449d with SMTP id ffacd0b85a97d-4870a951e92mr85662f8f.3.1789466896304;
        Tue, 15 Sep 2026 03:08:16 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm35564685f8f.7.2026.09.15.03.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:08:15 -0700 (PDT)
Message-ID: <3eb68f01-a932-4a29-986b-b506ec6adb95@redhat.com>
Date: Tue, 15 Sep 2026 12:08:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 00/15] net: enetc: SR-IOV improvements and
 ENETC v4 VF support
To: wei.fang@oss.nxp.com, claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
 xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux@armlinux.org.uk
Cc: wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260909100733.1139689-1-wei.fang@oss.nxp.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260909100733.1139689-1-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 12:07 PM, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> This series enhances SR-IOV support for ENETC v1 and adds VF support
> for ENETC v4. For ENETC v1, the trusted VF management and per-VF
> configuration query via ndo_get_vf_config() are added. For ENETC v4,
> preliminary VF support is introduced for i.MX94 and i.MX95 platforms.
> 
> On the PF side, the series introduces trust level management and MAC
> address assignment for VFs, and implements ndo_get_vf_config() so that
> userspace tools such as 'ip link show' can query the current per-VF
> configuration. The PSI-to-VSI messaging infrastructure is extended to
> handle link status and link speed queries from VFs, enabling DPDK-owned
> VFs to obtain accurate link information from the PF.
> 
> On the VF side, MAC address filtering is implemented via the VSI-to-PSI
> mailbox, supporting both unicast/multicast hash filters and promiscuous
> mode control. Since the ndo_set_rx_mode callback is invoked with BH
> disabled and is incompatible with the mailbox polling path,
> ndo_set_rx_mode_async is used instead. Link status notifications are also
> supported: the VF registers with the PF and receives PSI-to-VSI messages
> on every PF link transition, keeping the VF carrier state in sync without
> polling.
> 
> VF Function Level Reset is handled explicitly to restore the PF-managed
> MAC promiscuous policy after each reset, since the hardware default after
> FLR enables promiscuous mode regardless of the policy set by the PF
> driver.
> 
> Several preparatory refactors are included to share infrastructure
> between the PF and VF drivers, such as moving msg_task and mac_filter
> from struct enetc_pf into the common struct enetc_si.
Most of clashiko feedback is around the consequence of the 200ms latency
introduced by link state notification. Given your replies I understand is
a well understood compromise/design decision.

I think the better option is merge the series as-is and eventually
follow-up as need would arise.

/P

