Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253745;
	b=zyxN8N6hEnzAD6a2dgfDPbv6pYDWVogtlESeuUZf4IkwWUDiA3gOYNVXvn0NjDCmoXHs
	 aQxXufd3/OV+lHxXWSVP6+tyFXJ9D8jtL3lQRcM3rPsxhSW1x/Zgnj15jRQ82e29D6nM6
	 ACOXfiYfyqqjtlYzAfNAwJ4Nnx13MENg4uPuM1r0u8XK294vFt8CxZbBpptRbYeH8k/PI
	 DRrm6FdnSl8H2629lxXBt23L+FUj8ckfnoQwHLKvl4pgmLDGuIUahBN3jUcqqiD1rR3qh
	 IekA2WrDjPDulTLzuD5Vag/C/kjeCn/Ok21FJ7I3UbzZrJBnxM9RfpC3eDVfp1RdEmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253745;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ba2Q7AJDVOznKzIVSG4WADmv5TxkLP7hX7pgseAgvN0=;
	b=dVSDYFRvLMVm4BMC80C+054KCuux9ptlpjP3Rxw63InKw3NqMN6qdS1ca5fOSeBngZLo
	 x5UK4t5+Z0nOQ7OeMRYXbyaPomgnyDSC3mSmIUPhfzRf/WZ1FJm7cmH/2lu/1n9zBQ6RH
	 KobUlJeTqt9rs/4JJU/2CDXwcpguJOfC0J+TP/ruQCEQpItSC4Dmc+vEUnQmXgYkwxtzp
	 AUy09aet9IAq7lGCJtRSTVq0c8RbdGnrVFnhlyNxc1YKUHNUxl6W/I4E9ZIXScm47gDN5
	 HWB7bLkbLBhntqYheuvr+a/KGD/7/pMnig6vpCZqFpVljDWO9JwEzHHY8kp03O0Yx8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B3D606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B3D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so15584235e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253743; x=1794858543;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ba2Q7AJDVOznKzIVSG4WADmv5TxkLP7hX7pgseAgvN0=;
        b=rS+ZIqNrs0ZC+oQHaRuNDnzE6pbYJ3JXX0Uy1nKx3x8BwZs111n5g4rxCKc5pXxBUh
         SGXGJnpoV1TNKjsKyIUv0JxVnCZoSWiFzjz1uLsJQ/4WQSYdX7z00dXys72kbmB4vhLr
         H4Vf58Vm6Ko9hckIwYm7rXlcX+FZQJrYsSCXvWdLiJYVnU+xAznJa0FsZR36C8oDJF21
         fCGSqHGIrhzbg0mCGLcVkKZoE2xYsbh1+h3B0UnHdMdOjZ8onOdp9L5wlCMAkiSDZs7c
         OeH/06sxM5dNasNlvoKzSZY78GXbhNMDlYYbDFXjBEbeekKU4PFyF+swyJbPfZdRY3Xj
         nbew==
X-Forwarded-Encrypted: i=1; AL+hErG57AuQez/UaudOj++xO86I1ZQgoUUOUg4vftp2sYIOartDPukC9hDsb1loFdis9VJwEoDb+wbNJSr40po=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lB0i5jypLWk7XKmyP5bWAg/k8CEuv4UxfZAgpuKbNkVb41N/E
	QKYboovZWc2S26z4mRMUMOZZi7DA6lMnFam0Ov8U3vTdpF6qYjOFLseF
X-Gm-Gg: AYBFou2XYiSO7fOFMTF7y73pf1E5tHN5bJwOM7RGXQltyHYAgLBnS9fpusneDTt+4tm
	jAoK/55vApwrjJHSvtEHfvMLlKViaEcjYz1Q+v60uAVDHFFwLMcJLJKr99nFoBzGptEuiY9FXBo
	mI871ZdJuxtxvpkq0USOmNaky5eGYz86KdvsnuPnJT8xGoDJWYRJ8CNT/qzndQztqRRz6yXQzOy
	UY7PJ9PbVymA7rjZCP0buqUyotkXPg5XtiR9ILANvOczWXh7HuUC5x5cHZZtnb4cWV0tl/H1yRV
	LJVcZG2InD+e2HSENN1UpOpwqJXoCa8PRN+M//MRnyVUP2JM86IBfHHg4QlElY/onuwq47+nlwV
	Aew6PlrfQKEGP53cgwka1MmhkpCdplLgaO5tyG+8hyVefRvwDzoY8czwZS7Ws/FgGjxmGj97qSQ
	VAPSX0pcDThGcFxG2IOu6soubOYeBUawHdWyfyYlv22zow3Q0Owpd5R9OFIo6deUxD61yc6NIlc
	tsZS/38MGF0So8lLiIFJp6hDkAL6Qdbx4l+vV3DQOO0xdT3la862kr+PXNbPbGYB5Ksc0BqTQTj
	JIOASCgrwJ4iK5dfugMW/BcStGiKp7Qce5UMjX78T1bDfSl7+jwe0unqW1Gc4k1kuE+q0Y3k6Wu
	NirC4NLzUTfKal9ZITxiRHfBFZpvXFjZLABW41uOy+ndZPHZaSABirpnsLgHlzYA=
X-Received: by 2002:a05:600c:1d29:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4ba023376d4mr4246085e9.11.1794253742529;
        Mon, 09 Nov 2026 11:49:02 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02300988sm6618615e9.0.2026.11.09.11.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:49:01 -0800 (PST)
Date: Mon, 9 Nov 2026 22:48:58 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Dan Carpenter <error27@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] keys/trusted/tpm2: rename "bool" to "boolean"
Message-ID: <avIjqp3n29DKkpPp@stanley.mountain>
References: <avFcjHwnh9mrOEnz@stanley.mountain>
 <avHelQ1nxsDVcQkZ@kernel.org>
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
In-Reply-To: <avHelQ1nxsDVcQkZ@kernel.org>

On Mon, Nov 09, 2026 at 04:54:13PM +0200, Jarkko Sakkinen wrote:
> 
> Are we migrating to C23? I've not followed this too closely.

Google AI says that we will adopt C23 next year or the year after.
I argued that it would be would be after 2030 but AI said, "No, there
is too much juicy stuff in C23 for kernel developers to wait so long."

I don't have a pressing need for this patch to be merged.  I was
just playing with some compiler related tools noticed this.  It's
the only place in the kernel which uses "bool" as a variable name.

regards,
dan carpenter

