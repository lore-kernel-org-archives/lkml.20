Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341611;
	b=GjMYI+HgL3JOyDKC/dfMGklfUFNyUFxz35GQ1vb20n2bB3MHQB+RmY+QmglyZYMfJmr8
	 dspdfYB+7cnDPL5Y/g6Yf6tWdo4bA35Tc9WZSBxOooFgsf8BJKD6v8VdRzUxC/iyjlRRR
	 mVSKP6okxANANY5ewFUxpANNFZdF9cK9jxghjK9uXX3SHRXpi/sObnOE41ldk4VLVWZdV
	 3inNC20zo28UHk6wD4ZLBkK5/TqPPMU7FoYo/NoO2WBsz7gCRkPqORedEOZscUEM4gOGr
	 WUNfunUKCg0iaidWX+hEGEhU8/0YW8R+hpdVP7ZY0EQ63urJpPpMsl8YIuCC42LJICw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
	b=XUJRUdhHb2yHZcb/xKLVUajK+bR34Wk0AJNz+ej65qaMYh0NTuEKMpNF8WPxwk7UFm0J
	 rir7zUnegaIaz3HxCMS7l81sHLO9CdTD2KHduf6vns2JdqGoFU3trh0+Zt0+6gpa0kKJd
	 DALobn7Raq6Lpg7wL/N+npWB8T5ohT5d5F6M32wgHx6WV29PPX8vEh0KxHNH2ExkV82W1
	 3QBarxrPv55nRtFL45GmgBecIvvvfl53FdiS9anDSYyufxZObtUS+qTEKPTHlGvOyVd/W
	 sNEyROQvp/BK0+Ffu2zUlQw4kyGlxvBD7mHo1K4nQ1gdUSpEL4lYxB1FlHH2qiSLZIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmLxFpQY;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DD0606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24DD0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmLxFpQY
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6774639a8a4so276031d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793341610; x=1793946410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
        b=wmLxFpQYSyjon2RyTp/gnBSJrj/AkXKK/CGpaoc2ydd32rJ36n8b1m44ghQaVKhYjy
         qHzdKWUzDkAwer6cJjTwVHRmzu0tYKqswsEDQeg5qj1bZp0UmAad+j/SX5hnADnPD2vE
         BUknnzMO6mywxqRrBvi2xmuqwTk7IwOkGC9k0dRflf98qelQwwRHCyRJp74u6cVjC09i
         t2rAulH+Zos7xbiPK8j51BqUfdmcUST8lxcLc0geaiVa3uq91D96/9hid4MDRc+JAchL
         n2+f5oJGdgrTfTGTH0+kRR9REVYRK6GJixtaSZNGcWiRu7P36jeSo6JrIxAZ1kAPRm2W
         PE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341610; x=1793946410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
        b=A/ApKMFopJJvSHE4YVeIbGvXX+JtmoYNm7IcONlcgiXlnyodi9Mje60yL7RwYcUjO7
         5syZt2SXNACWB9LnziPaTnTKk1dAXeyuDhAAQ/Cmw7NVowfPZVBLr7oIKKK1bchuSgXD
         PU7orZrzytXODHcUR06rN5BpH8awb4WRimspWhLOXbyWhCXYj064uCJYjlbRmWqwBQUx
         ov0vRlzSj7tloUd1WHIycFEpS9KYz7hzyrwIsWF1blemikMbyD3flU3eUMr6pnjNJrn6
         5IEVRe2VMM4aBCTlg1EA82z3rRkoNn8ceHdzkb/boQcvN//k7tL9oQmfobgo0yvECDIZ
         9MJA==
X-Forwarded-Encrypted: i=1; AKwUvBwNRAfz/I/928/zWkxOax+aCb9gxmn81Q/QhVORq8p1Dm49Nm0x30T+ITe7VCvGTOMrdIsQLU21XRIB7G4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVJhJdwpkSxVlFDavSU18LXF+rexXNIme+0qRuLLovCFWYHTCV
	oIgr09lALt5Ob+Y9wHbAENwIsHgj1MCGNMn4aU7zbfaHdIiyzpNZTgQDCKYJpoatL8g=
X-Gm-Gg: AYBFou21usL9oJZIoWPrAk6vUHC2yL9oz3JvX1+tLfTpnYX5LxVhd9YO2XuDGwfGoz8
	9cjXPhHJUpptOVZH/AQzx8RvUpzMzV+MwyGg5AbaC1WsCuHqRFhCFxOu4FTwhmL0Dc82BUTyAJJ
	gzf5SKvNPRPk8m1bPIJosTjvplzCUKYUCQmAUU7n+8Lc2PLgxxalrCrximBsRY0oBZgaXuExdqu
	1bUejEghcVtsL1pwbue7RWZStr63QTS1wPUmrNS3NF/42PzkL/2US2uqE/jj3kEv2+bYLHzYieS
	/n4I6z4Vf4pHC2Zvd/P9ORje0zcMBcDKqQkPltbV2rE51hAevUUP6Lb2PB9CHNlq2IMRgfQMHjS
	11ol+Z4H67wN833wP2MGB3apIc9mRU7ZEx66vlkbEZJmkd+t0qTpUWBSgSCot1gTItmM8hCgLas
	HZ1e043nbuZVKwtrVbfs6PetokqMYl3w8+48qHNDsB7Rb0WvqPbVItZhEtANlFl8+Wl3p0N5svT
	0ZtzquRDxnE9k6Kx/PaqP1pYOdca0RHrLwxnVUpJsGKW2npb7Udw3gpSvUy2UiqkQEoX0XbLG6Y
	qPOetOwuHoGF3JOQWHlK/MpxYAU0Josft0uJYvNlO27XBpHhYxzgaUSI7dyb/rx6jZY6HRoyZpa
	OY4hbpEhG
X-Received: by 2002:a05:690c:6d84:b0:8b0:e385:ed99 with SMTP id 00721157ae682-8b2b66c78a5mr7452207b3.30.1793341609736;
        Thu, 29 Oct 2026 23:26:49 -0700 (PDT)
Received: from [192.168.68.58] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm4625317b3.33.2026.10.29.23.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 23:26:48 -0700 (PDT)
Message-ID: <dcd98f40-387d-4a64-a39d-9d1c7296ec7a@gmail.com>
Date: Thu, 29 Oct 2026 23:26:46 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: chipidea: otg: fix fsm deadlock and B-device gadget
 registration
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Xu Yang <xu.yang_2@oss.nxp.com>, peter.chen@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20261015084140.61544-1-xu.yang_2@oss.nxp.com>
 <a4edbfec-7343-479b-8488-38bcc3f23ece@leemhuis.info>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <a4edbfec-7343-479b-8488-38bcc3f23ece@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Finally had time to test, and it works. Thanks!


Tested-by: Rudraksha Gupta <guptarud@gmail.com>

