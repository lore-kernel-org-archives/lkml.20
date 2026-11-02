Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621540;
	b=IphhQ0AtvfNrWc5FK+CC8ryYh9Joqm3TFn0fEcvzr+G776Htrlh15XjAdOOeImWixgg0
	 l4dn0Lv5D/5I1Gyp7zpkBuRPp1cCAFEw+TiMXRW/pQ/3WPddJ/liGCc7ahE/CTPINVS2r
	 hSYNp/CruIUp54kO9TYAq8fq2LJ2xxq2UBGsvRI1a6gRdtRGOvETJ3XLjnhOQTK8Nu9Et
	 712MBsJjpru/l1rovaak50A4kA30Yo1i4Z1PN0+mK1bUUgAfxpmlQ2DaJsJ1JDMDZUw+O
	 A/KrGQvzECT2GQre7gR3XHq2YhfE8p12O92CFTkbBts5m911kqDguWy1qw0bEqKulww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621540;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=qjsgSEjuI6q3wyG8cOahzY11PjkthCnss0lk5lbrOPU=;
	b=yS9eh7DmKABe6n42KGcn4QV+IvPv4U2UKPNUXP5PWXiNoPR8bzTjhNLdQXs0pNIrgWHm
	 xOPHgIjIWQnqMYUDd1dpPo5i3aY0mrbSBXv45fNYQPngdK6rq0kPvuDc8whXI9zV+Pxu9
	 AB/YaIx/pckSBlXSbj7kAuNPBXSza8ZeF5z7DlybKVcc62C384niXMrnQxReDlDuz+FWL
	 4fE5wTC1znWepUeNAFyXo39e/kLF+zNOgLU1CUJn/72N1O8gHbc/zO11LyDr0Hj1osJNv
	 7TFb0Wtjrq7pkcILHP0NI79utFsg4JdBtFgsqtUyNYEF7XnZzGCFMwCuc3DZm8+ej4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bvSA4qb7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D394606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bvSA4qb7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5657A1F00A18;
	Mon,  2 Nov 2026 12:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793621540;
	bh=qjsgSEjuI6q3wyG8cOahzY11PjkthCnss0lk5lbrOPU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=bvSA4qb7gaXB+Kqw7+YIinF9/yzBF5H2VDk2RsyxSf9jvWdyS+hGZySA6MBzleRvD
	 I88ODREusmGxL2o4rmZ0xNq+F/pHcAKIPO3zKPHsBYv0bDcKv3BiKN7SwScUf4GPM2
	 cJvQ6QdyyW1zEPvwT3YuaKMU3V/NoWMBeVgGHrBfndngalaacdYdPBeQb4iBK9Naaj
	 OoCnjveJskVMr06bB4teJBn1Avr6BqOQ26NAvCfYyQPQ3+2lOb1M5iofdD9MW0m5Dm
	 ilBIr5cPyWFLnxW1UoTnlqueq0yYA6l8W0yR2VEBsyMkXe0bv9qqKqPtAdXmtrj/XB
	 vH8WC1qc15jXg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 863E5198003A;
	Mon,  2 Nov 2026 07:12:17 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 02 Nov 2026 07:12:17 -0500
X-ME-Sender: <xms:H37oaqsj62gZ143gQYAOk6kR11pQO3q-6lH7_kgbmE32ZQ3LONPbiw>
    <xme:H37oaqSlXPUcE334i4HkAXk-8o3584kmxyygJo78FREAHS-fNsu1ZaRbGfD5Wop14
    mognVTi8SUJpT2sqAi2lWG0m07n7wXtbDQDFcu_ytk9uAvP_39q3prr>
X-ME-Proxy-Cause: dmFkZTFGV+76GMHhPn/Qv6EVmdHDX00lw9odW8bPmFDJPcfjhyFYNuRZQEahF1VGFJ9hn2
    lXt180x8VjZec+s4VdGLoJNNlDAq7Mwc8kSoapeEbrsHIj1b5TAStmu3cWtRGxaZwW3zbK
    dB+L3w0x3Fjnv3hJ89cmjZirPofisz5mY0SZI3yUUpwomKYlCSzvsKRJ0WKdM6DBcPYIdt
    c6Rr7SN4gY0O23CnVNbTrQ2Vs9MpBdQDcVcxLtEDlD2t1gJjyYbTL5jgK9RcI/PsjJE38J
    lyGeguipH5qcq2SB74KuJ/mNogRxJmU+8clkfjKIg+PPPxc7ranAtk97b/mq6tNPBj2jKj
    cUpAguqS1g5DSJtjj7Ue9EHbQzvfoBrH0nJ7tIZxGihsagvjL6NbhGtUqKJF631jCnyS9O
    ZEmjTWEeOyH2hfizQp10erTNnbxcJ3d9ghcWuEy3Y0PT4w1jxTbb8wbtxAzIX/R7n1+K+P
    XiUGq47KDYqns9U8PMlkNcVBNzsVXm1EBlvWdv/Gh3Ise0efbgoyuLc8jFBoVkq1pyfVYj
    fsT1AwftejAVL2RN6egFUXa8J3pEYQ4N0UulGl0voMiQsgS0DKFDS0ZMIs5bjKNSbBLt2V
    0nU9OGioO9L34kPJv2OFdSiY7bd4us5DIMsB9C2oBdmFgEgnDO/fCSwo94pw
X-ME-Proxy: <xmx:IX7oapGkoXM-kSjg5KpMhuLVvAWuOeuWgNTdF-QOkLk80NEiUGcEdw>
    <xmx:IX7oamcpWBQ1b5kpVdtDHPcHu9UR_DHuNa-9iIyOQE1SoljGl6mNHQ>
    <xmx:IX7oaqo4SSV_Thjp8GWinZFCzl_k5N2Q6dL70zoEphDVenrkyzCluw>
    <xmx:IX7oavBaOKTfbCwoRgOTNauPMl3YBUAcDMIeYTY5fsru9D-eFKRTXQ>
    <xmx:IX7oard54v_VZBt-qFtO0xuCCSBiIjwwtqE_VV4osgqugP8LgwKJmSfL>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E9AEDF8008E; Mon,  2 Nov 2026 07:12:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 02 Nov 2026 13:11:54 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Pankaj Gupta" <pankaj.gupta@amd.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
 "Tom Lendacky" <thomas.lendacky@amd.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-kernel@vger.kernel.org,
 "Mike Rapoport" <rppt@kernel.org>, linux-mm@kvack.org
Message-Id: <deb5ea81-70bd-463d-8d98-ed51c316cf75@app.fastmail.com>
In-Reply-To: <f241f883-39f2-408b-9f44-574ce8d2910a@amd.com>
References: <20261102113127.161823-1-pankaj.gupta@amd.com>
 <bd56cfa0-6fdc-4e83-b571-f2abf647afa2@app.fastmail.com>
 <a9fb9818-39fd-4b6e-8998-761bc3439893@amd.com>
 <f241f883-39f2-408b-9f44-574ce8d2910a@amd.com>
Subject: Re: [PATCH] x86/unaccepted_memory: Do not accept ranges that are no longer
 E820 RAM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, 2 Nov 2026, at 13:01, Gupta, Pankaj wrote:
>>>>
>>> Can we just disallow memmap= when running in a confidential VM?
>>
>> My experiments showed: memmap itself don't have a problem but memap 
>> with a hole is causing crash.
>>
>> There might be some usecases which are already using this, e.g:
>>
>> https://lore.kernel.org/all/20261029-cma-multi-v1-0-2cbced8b5cb7@kernel.org/ 
>>
>>
> Its also good to have a general safeguard to not accept memory that is 
> not marked as RAM in e820?
>

Personally, I think all these command line hacks should be avoided in
confidential VMs, on the basis that the firmware's view of memory should
be in sync with the OS.

