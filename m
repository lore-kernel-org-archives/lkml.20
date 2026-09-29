Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDBA3AF650
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699310; cv=none; b=a2eXjtGYzjJwwp4Kyjp/HqeNiGwqnpZMbo2KP557DyNNcHW3WDPeMhR4FZBYRFCSDzaeRIDTRGRFOf4M0Y3fT8YgQsBusbwCFbUsrKangjwvmJTLu/FEBBWOasYt/KS/l4zTcNAVTACkFsyfrC89LqFWtCX9b1EhVkimJfx8vE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699310; c=relaxed/simple;
	bh=xNj28skhAXgmnVsiwfcuNW6CLgzTKZ1pXWol9Jpkmuk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=PTSlUoU+wQVPFSA3RFAHKGhwdMD4dzgP20fHnbxHH3PVtuU1dqF7zOjjqREJ17UNlYLp7k1WOJpY9upe+bxnWbE94FyWp/W7m+9m3jEuP1FyfOrZR/gfeOa9eyU6J8JlRGq9BMwQiykdUZAc7ka8DJpPBt1gFhdB1U/pjhLCIA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhD91/3t; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhD91/3t"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso2196909b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699307; x=1791304107; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xNj28skhAXgmnVsiwfcuNW6CLgzTKZ1pXWol9Jpkmuk=;
        b=MhD91/3tdjUJl9IUPFfbqqyNK0xlaM0rmwKbxZAFAptTMV/dgnRnWotrAxIRQG8R0P
         19JMuxhN5YMxksR9FtmZy5jOPtrKR4JClYkGL7etOIXzfc1cOMvNiTop1YVaH/sJ+a7u
         WVQrtQBoukQ5vMrKZjCsvC+ZdPzJE6b3kfTinH8X6WQlkARndwfPSCAmlx+1COy9ymTT
         5s0jt84nB9UgJqUl9xd79OAqlcIt6w0OyBrLLvOykkw+LLS6UWsE61rM3xH37EL33dQg
         dO60Aqachs4RAfvf6KKl+he5FWqePPWHPcJ0lNDDzlxrp82nh0knJtYeANONlakLbmuJ
         IF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699307; x=1791304107;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNj28skhAXgmnVsiwfcuNW6CLgzTKZ1pXWol9Jpkmuk=;
        b=pwuOOWHlQx2CcXZyLUEKchPOofPDOiaab4aPDkCKnBtB10AP2Sp6QfTxx2DQH/I3PV
         rJLvnLLhj/Vgn9EhHDmKzvZRbZniE4McfI+p5euyKWXMd+OOct+QW6RHftD46M4wQAC+
         S4DnhfIS1b6tbqz14boJFVzwwef3anutsEtgnng5nGJqpxyfpGjzTlGoeyigkcEDK4+Q
         F1TFVTQUyCP7p/S2gEsD3gXwuQ94XEwm8DL9DA0aGGEQwHu2xKk2pwobJo9fh4m7Z9XN
         W/pTsr+gIuJrp20cGqanAhj7vrcKThc/or9+AX9g2QJTlhkQl8SpAzbs+ntakFCNzXRG
         RVwA==
X-Forwarded-Encrypted: i=1; AKwUvBzgDuoWwS+QMIPqEluTHsrKnWIxJ29CAE2lDTRQBTPiPSJb3+0VqPNlWSuA7/sFiRd8lDaeiLsO+QtjPyo=@vger.kernel.org
X-Gm-Message-State: AFuF++n2MVAfE7WYLnk4IeZDwiaep/IQGIsPEYulPKERgpGZzbiMgwaB
	92xz9Wgenzl7ZPwww39LptTpiJawZQ8YnItcFj5BcAHwtrqlbCsiXbiU
X-Gm-Gg: AYBFou1no+i+js6m3vT4ZKWNSqn9o98fV5FVaeN3ihtA9GwEbAvVOcbOYhcXYp6/itx
	oFMo3ZuvmPEWB/AE9WoOXwiOl0pwbSKZ8xSlRxQzjuurLJ64h6B8qnF7hFs6SlNAlj7vD9kCAyK
	cg/JqCtbOd3UCGENVUpZpR3owZtBIrN18lqXQ1AShjRIBJxQev2E3/X272/bUE6QUFvb9XrgJPB
	xXaEXhCrkZvV2tx2eIXCVcntxMhvDh6UIUYe40AWJ6Kcb7nKBkbsM2o6D7BtJIJ6uWuQMlsgkLD
	xph19okgxQjhUrwOkslyxs3SGN89w3zlcoCdUyUZ1oDvbgE2e6MlAtOkjm3YpvwJ+YSB18RnTCf
	au/e57802KbDY6mBqmExWG7XtqUSxeF/ZeD9fr8wKOBTeJ+ObYO+Ri+1UhLKlMjtrd6sr4NhnRH
	8aK/UdrQPl5XSadtvdM37ICI4kNA+K9bTqG9WHW84xMrraWBsjBZAf8GCpe/m+36Vk27cgH6UQM
	3lugRr1ZaIKs78hPpxeFmi10wEhzunQdkebekKOUJFDPC4UYVmaIQKopyEC89e6F6aoQv/8AYy/
	hko=
X-Received: by 2002:a05:6a00:2356:b0:882:6993:25b5 with SMTP id d2e1a72fcca58-8826993339amr6934341b3a.27.1790699307008;
        Tue, 29 Sep 2026 09:28:27 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88685653bacsm276787b3a.0.2026.09.29.09.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:28:25 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 16:28:25 +0000
Message-Id: <DLRXXC72E2CS.2MRXIPM0KME7Q@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Puranjay Mohan" <puranjay@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Pu Lehui" <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 1/5] bpf, riscv: Fix stack-passed arguments for
 indirect trampolines
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Pu Lehui" <pulehui@huaweicloud.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260929083924.1851840-2-pulehui@huaweicloud.com>
References: <20260929083924.1851840-1-pulehui@huaweicloud.com> <20260929083924.1851840-2-pulehui@huaweicloud.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 08:39 AM Pu Lehui <pulehui@huaweicloud.com> wrote:
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Reviewed-by: Pu Lehui <pulehui@huawei.com>

You're sending Kumar's patch, so it needs your SOB.
