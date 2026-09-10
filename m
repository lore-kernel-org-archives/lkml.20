Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CCB34CFC2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021237; cv=none; b=nbfzsT+vIM5hnLZjIPCssbwZ4eUV2TPBVjrzTInXjKmyjYI/UhpOIhNhRLrx0LzhzhOy0Ck/DGS0km+zVGyYxaDs1/0LIhaNmImqjhdbOXLQZughq/OJ4queSeKmnyxTHOFZPDC4WPU7dZ+axNEJ/x23m3BZSR3OR5h2YMXOzTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021237; c=relaxed/simple;
	bh=MQcC4dR8FUCijCCrs52KbxdThXmJ8Dbr/UqfZTiRloM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKILSUmGe4k1nLZo+Mag3+sIpCziMnF395yTYlFqq7lCtfnxyxQQx2iD3PrufhSDs4LD6mxM486WB3FHzKDVXHdLLBAVYceImSGvuO+os7O7pKGcR4xH9c09d6ldFsEEejbdluH8atEP6RK2uMYBB8dFCEDPt5K9kfn08C8UVTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuMGrKvC; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuMGrKvC"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93997065344so516404785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021226; x=1789626026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7cyj0PhcIGIgu6e9EBrymS4RNeOJ3HjwObgNoqGt1I=;
        b=cuMGrKvCn9qt+NAdeDKfUYUpXkLo/4hT2KxxI47I1f4zk2Pb8hjhJR9DmFGNRwahsy
         /rvxwaxsXUbzBIpeChFlU6PCsiAvSfV6Ot1ZPq8w5txgYZb/O7fTQ4bx2FbxhALOoyqX
         +qrkFUBJim02rdFvG9I2PN0qUr0rsKf3GQsCEaooD8yqxq/VVCLG3/fOcd/WDhbkZ2Mi
         Hfsi2pgDJFvtaN1wuTC/CzwuF6NqxcS3QQFa3T5sOni7FvMPWadHisGXsKztwbMTlFCv
         fAfLuOoIxrA1gaNFutIum+3i6basKU82tjPPq7XBmYVigzMCkeCYW0CQPfbVijKyEyUM
         GVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021226; x=1789626026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e7cyj0PhcIGIgu6e9EBrymS4RNeOJ3HjwObgNoqGt1I=;
        b=TRC3Bsherlot0IqJ8B0Fylp+6tIb/NKambKHsE/vQPS8foRKR3b9jsNgDRNL4HruOA
         ykLfwL4Z+sqEiRK/IG3GAdaKov++GQQy90a4ZsLhifgOgkiVxTyGfPNrTfwxvOh6IsYo
         oEJIP8Ukm/AJxeWIB8TXMaRamoTFERX9efCUgKoGXIBXZnf/wxn0ZdnyquDrq9+EsdLB
         V/chd6pybS7t3SMuQ6cLIn9PZwqAgTuud4qpwV0eYywXCSzifCVpzC7fVIXkdUyqWreW
         lhTMM686B1mNBk+HKCPaPXYgAnYvchiX8WT820//3eowOpMh3EeWp6rhCw0qbbEaFnJ1
         rbiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT4z0/Y3S0Bf4M3xMdCfTDKfwjUtiApvqkhvblIE58C3DHWPqbrAeeyodqd06cJyrLwxkGaP5dAIbwshg=@vger.kernel.org
X-Gm-Message-State: AFuF++lE60/0eaEtQBDzESG1sn5SwWDawAwhlGCfmTxViGIrUamuPF/3
	j4cp9X/iArh4UTL3JgC8U/CT2ohEtaMAjIQakgQ9vqM9blru7wtyMcWckYUeHw==
X-Gm-Gg: AYBFou3lC2xsg+fS1APzlbJkDB0DIaVAuGKTG3d6QJYuiyoJBK3TYLhlbYL0nJ4eTnZ
	7UuSX+UanmI7ewFwlpm96ZzpAI7DUmZGoHjP68bijXOoLNxBzqF8wDhA6QZz0B1H1XQrsodAvhQ
	V7q7puvK4bLy7xlyI99g4xM+0E64r5RQtKMLEw90Tsnu/D8iAR1/OyiLq3nIcSi8+rLcqzs48BX
	IfhBctjOAv41Xajb1jok5yZuB18WYme8lbkt4JthT/P+lmpO0YaSTYGdkBM0Vvv8BfL3ZcPw53p
	qCD5iGzpnQeYXqN4HGa0FV5o7sXYn9RMAD39iH4AMDHAtcm8CZaDk5tdDeUVYuPxk7u03GM3B/4
	J+aB+mDB+Wk14RWgufPKW1pfRtc14irlw3mLsZ5WvK6X5hCdN7BR50Lc+9w8xhgR0U3JQ+CmZH3
	cIDjCtqN0HIEPULKeeUyfHU/vm+uFhCZeC72TILD54zE90TffD/LaRDnd2R++wE2z659RRYX4MJ
	g5shCfb4Elc0KdrRxNKpv0TiexXn+5cCbC0NfxHKPP407mKzSI8bUdpwBqcG0VcS+QtiK4+oKKx
	KOsW9DgVsgVnrJkJTVSnUn9FU4lDtgiH1WcX
X-Received: by 2002:a05:620a:2604:b0:939:4e49:4d3a with SMTP id af79cd13be357-939806da015mr4699071185a.27.1789021225806;
        Wed, 09 Sep 2026 23:20:25 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2c:d400:9135:d56e:c3ce:edd3? (p200300ea8f2cd4009135d56ec3ceedd3.dip0.t-ipconnect.de. [2003:ea:8f2c:d400:9135:d56e:c3ce:edd3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9ee9fbsm1621645785a.1.2026.09.09.23.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 23:20:25 -0700 (PDT)
Message-ID: <beb23347-b7f1-44df-892d-cf3f49e9b3d0@gmail.com>
Date: Thu, 10 Sep 2026 08:20:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] r8169: don't enable chip LTR when the platform has
 not enabled LTR
To: Yogesh Gaur <yogeshgaur.83@gmail.com>
Cc: nic_swsd@realtek.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Javen Xu <javen_xu@realsil.com.cn>
References: <20260909110554.1977-1-yogeshgaur.83@gmail.com>
 <9c34a1dc-6147-4369-8d12-9c5939d07530@gmail.com>
 <CAG6enPw36egoW=ezg1nnRvKEK5EEQX1h=j_TiRTE7F7PbxY8sg@mail.gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAG6enPw36egoW=ezg1nnRvKEK5EEQX1h=j_TiRTE7F7PbxY8sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2026 08:01, Yogesh Gaur wrote:
> On Wed, Sep 9, 2026 at 10:05 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On 09.09.2026 13:05, Yogesh Gaur wrote:
>>> rtl_enable_ltr() programs the MAC to generate LTR messages - ALDPS_LTR_EN,
>>> LTR_SNOOP_EN, LTR_OBFF_LOCK_EN, plus LINK_SPEED_CHANGE_EN on
>>> RTL8125/RTL8126/RTL8127 - and rtl_hw_aspm_clkreq_enable() calls it on
>>> every ASPM enable, then goes on to let the chip trigger L1.2.
>>>
>>> The only gate is tp->aspm_manageable, which records that the OS is allowed
>>> to control ASPM. It says nothing about LTR. LTR is a separate PCIe
>>> capability that only works if every device on the path to the root port
>>> supports it. The PCI core determines that in pci_configure_ltr() and
>>> records the result by setting LTR Mechanism Enable in the endpoint's
>>> Device Control 2 register; per PCIe r6.0 sec 7.5.3.16 a function must not
>>> issue LTR messages while that bit is clear.
>>>
>>> So on a platform whose hierarchy has no LTR path, the driver now tells the
>>> chip to start sending LTR messages nothing will honour, and ties ALDPS -
>>> the PHY's link-down power saving - to them. A report against RTL8125B
>>> (rev 05, firmware rtl8125b-2_0.0.2) in a mini PC shows the effect: 291
>>> link down/up transitions in one eight-hour boot, with repeated downshifts
>>> to 100Mbps, against four transitions at boot and then a stable link on the
>>> kernel before the LTR change.
>>>
>>> Read the endpoint's LTR Mechanism Enable bit and leave the chip's LTR
>>> machinery alone when the platform did not enable it.
>>> pcie_capability_read_word() zeroes its output on error, so an unreadable
>>> capability takes the same safe path.
>>>
>>
>> Thanks for the fix!
>>
>>> Fixes: 9ab94a32af70 ("r8169: enable LTR support")
>>> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2529752
>>> Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
>>> ---
>>>  drivers/net/ethernet/realtek/r8169_main.c | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
>>> index ec4fc21fa21f..c1ff4e898570 100644
>>> --- a/drivers/net/ethernet/realtek/r8169_main.c
>>> +++ b/drivers/net/ethernet/realtek/r8169_main.c
>>> @@ -3037,6 +3037,16 @@ static void rtl_disable_exit_l1(struct rtl8169_private *tp)
>>>
>>>  static void rtl_enable_ltr(struct rtl8169_private *tp)
>>>  {
>>> +     u16 ctl2;
>>> +
>>> +     /* The chip must not issue LTR messages unless the platform enabled
>>> +      * LTR on the whole path up to the root port. The PCI core discovers
>>> +      * that in pci_configure_ltr() and reflects it in LTR Mechanism Enable.
>>> +      */
>>> +     pcie_capability_read_word(tp->pci_dev, PCI_EXP_DEVCTL2, &ctl2);
>>> +     if (!(ctl2 & PCI_EXP_DEVCTL2_LTR_EN))
>>> +             return;
>>> +
>>
>> Can't you simply query tp->pci_dev->ltr_path instead of doing this low-level
>> PCI register read? When reading through pci_configure_ltr(), I think this
>> should do the trick.
>>
> Thats was actually my first version, but it does not build: struct
> pci_dev::ltr_path
> is inside #ifdef CONFIG_PCIEASPM (include/linux/pci.h), and r8169 can be built
> with CONFIG_PCIEASPM=n.
> 
However, w/o support for PCIe NIC's you don't need rtl_enable_ltr() at all.
So the complete function could be conditionally compiled.

> I think we should keep DEVCTL2 read. It is what other drivers with this need do
> - rtw89(rtw89_pci_dev_ltr_enabled()), iwlwifi (pcie/gen1_2/trans.c),
> qed_rdma.c,
> rtsx_pcr.c all read PCI_EXP_DEVCTL2 and test PCI_ECP_DEVCTL2_LTR_EN.
> 
I'd not consider these old drivers as role models. As far as possible
I'd like to leave dealing with low-level PCI registers to the PCI subsystem.

> Please suggest.
> 
> Yogesh
> 
>>>       switch (tp->mac_version) {
>>>       case RTL_GIGA_MAC_VER_80:
>>>               r8168_mac_ocp_write(tp, 0xcdd0, 0x9003);
>>

