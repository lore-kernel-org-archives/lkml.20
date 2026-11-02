Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659770;
	b=HDaE3mXG+epngVE5R74fyz/5KqP6mWXxTZdvFkN/ERqPIQd4+QdrC497XOBHy25vsMYv
	 7gU6lBil9nQWXaQmaVuAZJxeNvvxU5XwUD9DjsFlXijlvz0+b571/SrcsV1OhCn3zdBBE
	 ZtfJD/SkH99Gx+s0/3kp1eEPY8vSbFksc4Egj4zjbyDVOVsvUV1pZhIyXNFerd0sdPv/B
	 XkBpQJHg6UmQ7gXklsuX/4DTZeVtNACkBak3qCFgxB4waQ//PT7LvjZbr1Enmkiu/lYYh
	 vteR/c8IncOd3jtkVMQWGACLO9oYLNUcy0u2zu1l5EhkQB5uGQyWNUvbd4nQfDk9M7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=xPVIOrJME2+FRmlVa4Ph+81dFFJXHKxCy7RK0PFxH3U=;
	b=xWDrF3FL7e73wsvsU7ydR7vjDNLngKSl9WYem1DBRccAKiFK0v3rPi3TSalo3ZXGUbvP
	 0UrU/i0rfjFEpmkthLuHT0N7J9Hshv2Oi2MzaKaY4sXby4DqOztfQB8f2+WDnYgF5c3b0
	 0InIfah9XVxDQNqsraky3JOslkNaZpeXun7ckUa0fvqEJX0f7XS4+k5pXvPIOfgUvopLe
	 Ak12Cnr8ZhjLgUOT6qMkD8bY0sM6vUmucOtDhZ02NstnmTXWSNnfldaLE5U3upypPbG3C
	 pIilEymolhORsH3mFRHQYPWlfpkh/h9Ea4bCDWQGk2kwui97bb97s1kvcBs2vbFG5Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVfnC7Sb;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CED5606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CED5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVfnC7Sb
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1368624a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793659770; x=1794264570; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xPVIOrJME2+FRmlVa4Ph+81dFFJXHKxCy7RK0PFxH3U=;
        b=ZVfnC7Sb4eNB8b65r2Hc2izQ+1dDwA0kPYADjv5ttcWGWLqrvarH0Ymb/PlTJf74fE
         Tz4jCUP8Enu5fId0TgsCN0U0VdOgrk+9gX0nprDvgY0y5Ms61VebCt3oh+i2yjv4qy9n
         XhpjrMz8VKeruwhJyCGjrSLisgFLdkRNleLHoDlEVHmyxegqVkQb3VAo16C722Zf4C5O
         scIq4uv5FaL34ODyjof1rZF4+uZGJxNOfdpfGB/2II1g3Db+Ns5KeIyb3LJHueBsNqDL
         PNWqM8TNPlFjC/MHqJteED8+LCyQ6P3m4Bd3At9lQSK4NVcRExQywUHX31IZjSjXEBXe
         D8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659770; x=1794264570;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPVIOrJME2+FRmlVa4Ph+81dFFJXHKxCy7RK0PFxH3U=;
        b=LGdqKnH958Bw3g+/k94zvZLIgmmdEEocL1xx0+n0MYc1/kthB6+8+V1dtKXyzK9a8l
         KBdZ3mHJyEl7RD4jn8NbK/4DxMSPXImOr+gRmWMx8WkupHBYyNWIwHzcqI58eDQMOVR9
         BFJCNEm5XowNExNIuNimfg10mgVQwGzr+MKiMCfBFVcPu1NLJ8eel4+ht5FaobnN1kDl
         AAqQ2u6HeyAYWMl3Dsmf2MUlV7aWrxkNrvThSp+RbUeQoEsbAF7ef9hHS5GGaX4Oerk0
         VyU2IQYunDbI9d/TpJY8PpISRD6Mj0pKDDwYYr3I5gUsu4vt9cEHq9Kq2BqtioZhPgIE
         jDyw==
X-Forwarded-Encrypted: i=1; AKwUvBwTb+WPTHsVBLqcIVAERZhWDEvi40s/Wz7Jss33Op8/WOzwe11ZCc8V2PgxMquZqhAyUT5nwuz/ClqTJSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xru3ePcpjAaavrXR1SU74vu2V9s0X1VPonr7thWCaOiSfzBJe
	op73YQDRkz2cGbK9Dpl+66yi9Jgs9qQYiUYZAGLu8hHnp3T64Xpst9np
X-Gm-Gg: AYBFou3O6cXmeAmsLISyHq88UQCICUHiLuvDWJkDoy3Dz7UELfRXNTWV320Mb3qaVjK
	ASDW6xQW8f+u+R4UA1pYZRqHVfUegLilsNwXDvtE1Wan6crz1gWNHK34EPgxYYtUfswKH3Od/tP
	2zktYD0af7X7eJsOhGsolT21HVxJWwCXpnLm3z7AeexZriUdRiu3hW3GFVh80i8zx8WjnoRoAhF
	oTTAP4M9E7iup9USqA6CQhQ7kpyxFjB52M8Es2nVFMqOWw/8pHaDktWboOZJ/n4+1lz5FKshLXg
	R/hXlARVQv7K1i5rxjGhkxQ1qNaNz6lbNMyja3J7wReGugGBk9Vm3vnx4+xFCW63mwNgHyyEb14
	n1bJMrlLqQdECOYqk9NfqIUoHiAkjaWT8FhgmD4b1l1uQYnm7FRRQqvfVmnYF5gFhNSNAfPNPb2
	D4qSkorlf9o0Vzi164Hntswollu6JnE99VcLH8VdPPBarW+5+sp1PN32Hd3OlqofELMDfAVPq9i
	ViisdAiF6W6xLQ50AB0KjkYWrtxcVenNorgdeuvXX+XBCplg7/tUIK3oZ2y+NoTF/wk9Vbim/wr
	zrhIR9wosZyXcAKzieSfxarcECThvAsLwBdxRLNTDaRFfi64cz0lIWw/hNsaPzE+RGiEi3WGM60
	3zClTSi0lvt7YBE6NajaMpa/qVVJudM0P3g==
X-Received: by 2002:a17:90b:57c5:b0:3ab:31e6:12fc with SMTP id 98e67ed59e1d1-3ae89282d02mr9413027a91.0.1793659769481;
        Mon, 02 Nov 2026 14:49:29 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c583d0asm1128204a91.3.2026.11.02.14.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:49:29 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 22:49:28 +0000
Message-Id: <DML3BMBE94PG.3UVPO48U5LTPZ@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <viro@zeniv.linux.org.uk>, <jack@suse.cz>
Subject: Re: [PATCH vfs-7.5.bpf v2 0/3] bpf: Add bpf_path_getattr()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Anastasios Papagiannis" <tasos.papagiannnis@gmail.com>,
 <brauner@kernel.org>
In-Reply-To: <20261102104655.70901-1-tasos.papagiannnis@gmail.com>
References: <20261102104655.70901-1-tasos.papagiannnis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 02:46 AM Anastasios Papagiannis <tasos.papagiannnis@gmail.com> wrote:
> Changes in v2:
> - Use a thin vfs_getattr_nosec() wrapper returning struct kstat. (Alexei)
> - Remove struct bpf_file_stat. (Alexei)
> - Update the documentation and tests.
> - Rebase onto vfs-7.5.bpf for merging through the VFS tree. (Daniel)

For the series:
Acked-by: Alexei Starovoitov <ast@kernel.org>
