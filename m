Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181194457C6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458302; cv=none; b=SRThftmR0jayy6Hvx6DiMPow+AcsTXzJU5GVDN6ZvCTiOp6hulaVlKSS10+H9E62WZCkhGaid8Z7kLQTLc/FYqbcR2fjuTgqptIML2UkcWSWxSp0o/HsZ75RKBuxK5vvHi/gpCmVdXkD3C+PlAe5PBy+v421LYDo6JOuZUJ2TV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458302; c=relaxed/simple;
	bh=OgjI0QYOrcZ0K4uzGm3G8FL/97VffD/jxuUVF1fX/No=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hHPt/+KSp/Yjcxxj1KGAHA12Y6iQiLeMZHo6r0uo5qchZfF4xM2A4uOgd53ZKQW/WyLQitth+JzNlEuWsIneek80Uhxm1iAVXt7gzSTh3dkVrwPC1KGpidQGwcNsdWw89WIZ25JDPBOesiXlfdl5R20BRO2BAPzGlDzLVYi0xKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkLVCIK2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkLVCIK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1341F00898;
	Tue, 15 Sep 2026 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789458300;
	bh=iMU/arqMuWDS9xFmrOO3zgEmPWqgj5M6PqpM72UfMoM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=CkLVCIK2sf5wrtIaj+v9uTXe5BoTvOOqUKNNDMJoy6htX/LjVjlcaMtTgTO9vu/XG
	 b6W/XnuxgrzZITD6wvrJ7oJH0Pjne5hw5dOM8rE2+mOluG11GLnKwOLAuZSV8mQwRG
	 qv0UzrAnXcEt8yMmlIr4s6zgr7EU+xUD0kcnv3hw6s4oEPq2Rt7rO3mGRrHeS0DF/3
	 W8Tj3oSdqO6gWMgeTA1J89xZbQuQ7vsaOUKwizgHilREv89XVQgdw/ubwo1q7CDFIC
	 sg7Fp1Wo2ieyX+ln2EZaWlYgvBTZxjLvnSSXTx3TzB8ztyWUmM//Jbl7HaWBIKpEsF
	 qWTknvmZsFDhQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8BE5F198003A;
	Tue, 15 Sep 2026 03:44:58 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 15 Sep 2026 03:44:58 -0400
X-ME-Sender: <xms:efeoasyOX6RgrOV4aveeq2MjalMLKkVT8zM3FwzC72Fs0FGAjf4KaA>
    <xme:efeoarHomT6WXyx4FrNAJAAP2jjtOahzOm8XnKow5FCelsUSjZimmoc2bTbz-bcyV
    onYAWPqhaTU0sQpt_cB3L55Epv0lgBa86J0guUrpHyojkqE2XdTJSOi>
X-ME-Proxy-Cause: dmFkZTFRtcbYhvgqKGVpEIuwxFSl6khMfJxtXHDqaEpqyv6uOGv6AydGLujjzg5g//AttE
    RyrNJDhc4fObyhVJx4hZsNLVGzQoYlF4VuksRACctAi+0paoTNyTzO09IGQdDZwekkrNNE
    SgjmfG9+H6wUOfeO+4EPfMfMPpFtgLYc4bpWHzQ5+NlNVyQVndzrXNptDfCos0rlWBX5xX
    MLpQoQnOr8lBZau8HIG+mGIzNjzc0FtXy4gBKH4Ri30SaGqCAunU8nRvfMXxMR+ZYAlPmn
    Rf+j67fDxGCybm6eL4SYdGqGWdNPcI1E767E9uQ/PAARygQPMJw32SU/2XMvs3UNO7j7l0
    Edngi+KIVwEq3V1YGbQHFuWST1gVR2TcR8Zs3v06xscmq/YrTuBZk4c95k4gZfzpZpOmPT
    TsWB4FO+dMOBbGPdgb9K4JNNFQEjFQ63BrKk6qAR+zlHl7cDB7zc/oze6lifcbXM8z/FAo
    RCX1ptJ4JnqLs7Yw02UhSwet8Ih/0q457DV8VEF5IpdUfIy5xws6qiH/8fW/oqPnZ8of2M
    qpw8A3YHitXbIEEUDQ0jerDHjmW7Zddtm0zHov99HITEGl1WjAIBCqg+cNjagO5rxP6Ab2
    pPhrC9HJ5cAM0nGQEwZm+IkrWXU5YSJm/1CTXpZ4sGb8G3x/leM7xMfyXs9Q
X-ME-Proxy: <xmx:eveoarZFk5Gz0YADEtwlIQKh7JPsapgc3yQvS8CqI1BUnoh5wj50Sg>
    <xmx:eveoaoNAPj3vAAJu0app-iP20-EBfroo8pYccxo3gHJj4u6i4zpYQg>
    <xmx:eveoaoZffMHFoeFJBRO77SK-5qqF9Fe0MPvzoEEr0A4OzZiGyQdvIQ>
    <xmx:eveoau1d5bHhQhmy77Khv91Pc1rybmXuh_GYiudodiHuEbC9xhhEVw>
    <xmx:eveoamf_cnWeCNXS1_oRIzQPFw3cL0gDN1w6dCtrf7krHyWu63BMy109>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4AD91F8007D; Tue, 15 Sep 2026 03:44:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 09:44:34 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Melody Wang" <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Tom Lendacky" <thomas.lendacky@amd.com>
Message-Id: <e624a245-e699-40d5-9948-aa77da5c44e1@app.fastmail.com>
In-Reply-To: <3f4e75ed-9a4b-448c-adb4-5e2e8bae8b11@amd.com>
References: <cover.1789345277.git.huibo.wang@amd.com>
 <d0b15a9b5f6e2199ff48bb77e9396044fa96dfb2.1789345277.git.huibo.wang@amd.com>
 <8e4b05a5-61e7-4015-ab72-1e55156e1772@app.fastmail.com>
 <3f4e75ed-9a4b-448c-adb4-5e2e8bae8b11@amd.com>
Subject: Re: [PATCH v2 6/8] x86/sev: Register the guest with the SVSM APIC protocol
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 15 Sep 2026, at 04:04, Melody Wang wrote:
> Hi Ard,
>
> On 9/14/26 1:06 PM, Ard Biesheuvel wrote:
>> On Mon, 14 Sep 2026, at 02:57, Melody Wang wrote:
>>> The SVSM APIC protocol supports 5 calls. SVSM_APIC_CONFIGURE_EMULATION
>>> (shortened to SVSM_APIC_CONFIG_EMULATION for brevity), call 1, provides
>>> the controls whether the guest can make use of the SVSM APIC protocol.
>>>
>>> Implement this call, and register Alternate Injection for the guest
>>> by default.
>>>
>>> Signed-off-by: Melody Wang <huibo.wang@amd.com>
>>> ---
>>>   arch/x86/boot/compressed/sev.c | 17 +++++++++++++++++
>>>   arch/x86/boot/compressed/sev.h |  6 ++++++
>>>   2 files changed, 23 insertions(+)
>>>
>> 
>> Does this need to happen in the EFI stub and/or decompressor? We have swathes
>> of early SEV-SNP boot code in the kernel proper; could it be done there?
>
> Let me answer the question directly first:
>
> Alternate Injection is used by both the guest firmware and the guest 
> kernel. Before we run the guest kernel, guest firmware - OVMF - is using 
> Alternate Injection for interrupts, etc.
>
> So ExitBootServices() is a handoff boundary. When it is called, the 
> firmware's use of Alternate Injection ends. It must deregister its use 
> of Alternate Injection at this point since it can not assume anything 
> about the guest kernel that follows.
>
> At this moment, if the guest kernel has not registered the use of 
> Alternate Injection, latter is disabled and can not be re-enabled.
>
> So if the guest kernel wants Alternate Injection, it has to happen 
> before ExitBootServices().
>

OK, so this means that this code will only be called from the EFI stub
running under EFI boot services, and never from the decompressor when
doing traditional boot.

So please add it to the EFI stub, and code it against the boot services
(efi_err() for error messages, efi_exit() when aborting and returning to
the firmware, etc). Implementing this in a hybrid manner seems entirely
unnecessary.

