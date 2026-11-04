Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793769345;
	b=0XSAmSeLsxSnAVkmWhE4zHOGvTYtwlYebSdDFvSfzTp2XG3huzV/Eu3JXGXw3L+14KhH
	 BSHr/ZU1Ke6irx4Fy7bxgWPQOLhJZhJ7g1WJQ8FMH0Gd1+aiZguSl86tsAih2fO3eL+UI
	 a4NhoLKgYmuAWX2Dhd3tiKR6szmI598WIZI2InyKCLVh+39JvaShjtAyVOCiLTb7nvewF
	 Cb0isUixkospAUEkwR8g6IKRoljf/aQdHW8jY6vupkCtiU+Ct3o+zEJjOK1CNaJcy87q5
	 pWiG7+I93Y3VuHQJ8tTXqwD3UHFYZ7eQBn+t0/7w2ONHAxjit6qUiNG2MCrQjGkH70g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793769345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID;
	bh=T8P7appdhE80NPVD29mCbyFhEvRJvG3KSYBeV4EyGEI=;
	b=FDlm51z56aCL2srCRf+iE0i8OzG5gdvV3evPtxISN/s5hbNkYEvYrcb+iH+IidoGea/+
	 dgePQk9xQ3rpKk4VNV/AHuUrF7nIYUAyNCFkGob15Oig4nDVsVSrNeykWv0RyiIEKfhHi
	 AzGzRjugYZQYxR5A403+c64a1apR+MWOypAtVMdV5XeRKxoui4YHUUPGEjdyeNvEbmKv/
	 3N7vQxdEi6Hf9OrTQXBVuU1KU2ZOVwt8O1SGWNuyc0bFwQFew8R0izQpzWsbv5ZDSNXIY
	 ZcnVq2qGa3CFX40kN4qNOY8NGPtsMU7703z78Y1187GsC9/VFms8sP1iW+ASA62t4Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9T5DYpb;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC915606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC915606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9T5DYpb
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35c76e9614aso376159eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793769344; x=1794374144; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T8P7appdhE80NPVD29mCbyFhEvRJvG3KSYBeV4EyGEI=;
        b=M9T5DYpb3AKEtJuiGrvRhurrvglo6wefC551tSEx0mfCDRHPxRzOacK9f0H3nAQ3ve
         qDlN/xKGH/PZHR9TIsI65LI+wv6ENr8k9nBRI+JCKNR7UF7yDqX9eg1bbmgGGkTPkfp9
         G8BpDsqXd5wGw7EjW4zXOe94gwM5k2oj2fIE0qrgqaEApNIbvUmk0Cum3wBxb53bufRx
         h7M+rzhHVwovyVtAQ5W/6HcQMSpyOoUDi0+WnFYkpyPqYsX9COuArbQLLvXk9lf3aEuq
         9kwP4cSWAuO0MLK6j/M2OeiWm7oaUH1tN3OEoEO0NvXitClhleRITJ1C8EJIRyRw9L6o
         eABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793769344; x=1794374144;
        h=message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8P7appdhE80NPVD29mCbyFhEvRJvG3KSYBeV4EyGEI=;
        b=ZBbhjihUQbrBBiaX5E7eMDtEXYiH1rtCpJv8mXXtXiXrcNazbRK3AdCMEEEhAtXlAq
         ptJx1tD8gojwbcsECHmGphrZdyNqCcmylpk0Po0otNXcwSPVMsIpw6pdwC75FCIdyDUa
         r0f4EzADWQvHdiQvBIYSVN8jQTWAKezx2pom4g1VP/i9PbhAjS6ZgCRKhBNm1BIYAY+N
         bJpBGZUm59iBuK/CYVrGD7Yv1Gh+fidjZ8Ujr+nqUpvn2WtlBVVGcSbG0stgLeeMoLwH
         DskJiI56LmiJTGjyUVt7CzUsf+HSgBVbAgsgeKfoxtCtdsZUEI8WYRiwM2FFl8NyEJMZ
         V/zA==
X-Forwarded-Encrypted: i=1; AKwUvBz9ruTFiYQGqzMH0nxdMmzR+0jNtacNHocWBE2OEVKkzfbEo6MMFxtSZdxmXa8u5xhyeaBdlyrO0dNXz+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hzAu6NgSpIYYGyeBk6MdboCke+qERVHiG5vCiusDLNIUIND98
	im3pQOB8H4VZg+/QMaV4+Lc/rXB18YNX6tlgAqTFqnsxMFQoJ/d+mfQ7
X-Gm-Gg: AYBFou1/dadr0WZld2VmNnvlShWyrR0DND9MUcQTXNlp1yhZ8iu7ZwaZiUBan/8R+VQ
	T4RKLXTUL5snwRQ9Pu2qFOh0a/7N/xy8+oW/CZjt2yGGpCQjQ7TX4il4Sr6snqpf6zg1Bz8lVet
	xk4Ty3qa59qbGLqxKzVJYas7rSXRcBC3yRZtvU8FbAyhEdzVyVyiXlIJA4FpfJPBxC3GkaTkk3d
	sqIeNnaixToGmQD/7dggSGOI/4+uv6YHLu9dQx/aIlw3HCrG4azZMTS90tLM+y2VYcSlOta0Ner
	ziWen8EgL0c0HOoRaHI2SQdtG7yjZss/4s4QlDFlEfPe5kXJHlV1M9mxMFmFiZuCOr+tbHEeaEg
	iHuyApXCY/cb+H72U/9h9pD35CZL6J+fb0Ndye5h3woJtQpx/5xJVRkoIgqt3kUIhm2FCXhWLSj
	JFtJttZPPn2um4iDsDGsF6ug4PC6aLtVfmd1zeFPSYZnIaGk70vNbH/cJqbKrQz+MS43tS4iuhZ
	wIyfz9mG2l06PwSPyljYxUPeFTxMBFCaoCJOIm96CTMMpuJNUAgi9qz74xhN4qwtZtbGtH0iqlg
	I+vBWpZQ3vc99KiKbkRcoTCnAkFIOk5JJ8m/O3CBNseaE2K92n1kMlmZZIyEaahflg==
X-Received: by 2002:a05:7300:c019:20b0:36b:f09f:924a with SMTP id 5a478bee46e88-36bf09fa41emr5919483eec.14.1793769343559;
        Tue, 03 Nov 2026 21:15:43 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38f53a6sm3315789eec.15.2026.11.03.21.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:15:42 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: tristmd@gmail.com
Cc: cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] extcon: max14577: cancel wq_detcable on driver unbind
In-Reply-To: 20261020154119.2568395-2-tristmd@gmail.com
References: 20261020154119.2568395-2-tristmd@gmail.com
Date: Wed, 04 Nov 2026 05:15:29 -0000
Message-ID: <179376932942.49961.5227159207452168407@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hello Tristan,

We independently reproduced the max14577 delayed-work use-after-free
and tested your [PATCH 1/5] ("extcon: max14577: cancel wq_detcable
on driver unbind") on a clean Linux v7.4-rc1 tree (6628e7d4c6b2).

Test setup:
  - QEMU/KVM with KASAN enabled
  - Self-registered I2C adapter exercising the real max14577
    MFD and extcon probe/remove paths
  - wq_detcable scheduled with the driver's 17-second delay
  - Device unregistered before the delayed work would run

Results:
  - Unpatched v7.4-rc1: 80 slab-use-after-free reports,
    starting when the delayed-work timer expires
  - Your [1/5] applied to the clean tree: 0 KASAN reports,
    with the test running more than four seconds beyond
    the original expiry point
  - Control run without early unbind: 0 KASAN reports

This test applied your posted patch rather than only our own
equivalent devm_delayed_work_autocancel() change. The result
supports the fix for the tested driver-unbind sequence; the
synthetic I2C setup has not been checked against physical
hardware.

Tested-by: Yaohan Li <shunsheng1218@gmail.com>

We can provide the complete console logs, configuration, and
reproduction details privately if useful. The investigation
was AI-assisted, with source analysis and test results
reviewed by the human tester.

Best regards,
Yaohan Li
