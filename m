Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625082;
	b=eoxi41Pal7bOBsrJe8CPOu/KvvhKzYig9oF0Hgv9/1jvRwLv19eju927+sLQkDMv4goT
	 MrE9Bg33lAq3SQebxyJDXfroLHGyzzaQ4tXVzin7jIRvwpTlkMgJzX+fWhQgG3EkQkyO8
	 ca6MpVAI3+VgFHqf9IH8E4blfuSlTii5M/AnXMcV4JJs1gMFe4OoqU/0wJXWL2kdxceoE
	 7TC1+75UZ9vazTJLrlXf3QaUuhz9ciGJjZsQ/4VqL7vTf45dd2TsKL8yaxhspFPxhTDio
	 6SpdGK1ZtgW1nTyUQKUltpYP69fEttTdbaVwALcqCcq6IKdQ5eUnOEWEv99pZmudZvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/KkEapmHmEQSCa+rbG28ksVcUxF90U1MuYpU+KNvA6E=;
	b=IWaaI63PU/R1XziNiWWNNycernynAHhZmBumSSy+yZ1yjCVdr9ag3G7v2WtMwZvdCsV4
	 rYNT5fQzLneCV5aQMU7UiT5iypvMCZN7g8UQTMK7qDKPXbcjT6MmQktl5LplvtxrIvuW/
	 L9i1bOsQ6MNIZLrFdqlZCuxOKu6aGNP9MvYa99qelf44rcaXTojIApMXJAcB5+cZK7kMx
	 S5hEB25UOeXODDTnYGyhD7zagWPzRYMYOInwaxPtZji51PPFZkMWcNFPf8/D7HmId/SdE
	 9oMaC2FsRz+W4C2sxihehqDh7ImjZm4jzd7fhscRmP/1rF0+ffeyfnE88zalVIVIEqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=truenas.com;
	spf=pass smtp.mailfrom=truenas.com;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE20606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE20606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truenas.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so19375395e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truenas.com; s=google; t=1793625077; x=1794229877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/KkEapmHmEQSCa+rbG28ksVcUxF90U1MuYpU+KNvA6E=;
        b=LXvgckeLj3Z+FazCp+JajvjWzzqL6coWoGeufzjbrZ4/aRxUAUe0kAfQO1ejj0Uujs
         OGgclZ1V4VhMywwJyE5JuSNinJrZaeK3T6H7tPZVtgii7jcliUaO5RQGoX/CbZT1Cs1M
         Z3V2N1L2NwRzEdAM6JBXmdVleRNGar7+k0JirYGNv1AwLU+v+RIOH0FqMENqoKe5s9C4
         vYIhmps4hMclAuJ7MX6WKokPFWcVJD1l7aJZYUhmft7yBAdqBUFINNpWScqvHGWLllvA
         wS3VhpM/MCwW+3juQKNAVsx76zsS2Kwr8T2Q4JmHLx/Xl2NsZ4+Wy+imMVdYzE+L5DCM
         Wnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625077; x=1794229877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/KkEapmHmEQSCa+rbG28ksVcUxF90U1MuYpU+KNvA6E=;
        b=ZgURyuHelcwHhLQL3Jwm8734Y2nDIhiaw7n+kHlPY/cWMJN7B5CaEN0EQFDf8r6weJ
         8R8aRTOBUcxSwpW0sN+lPwDVOVNs58v+ei2NtX3pFRSBEEadHl+KfPPWjswefip34t7w
         oyWE1Abjzf+s+QwGxbnMkNWdQQFeE/GQbCBtV20E9EGU5BTQwVhA0A8SqY/kTvc+MTyK
         n+53Kunh1fO2a3KatMWOpQfi7bHBa4iLH8PFJ8zSx6Lm/v7pmA+U4Ru4viCakbeEEeK8
         Feap+PDVSYtCJawqD+Z1pU70uB+aztAm+qYkm+SpLj2mzdlGcOqKCDkFPAso80OUtSbm
         i4gw==
X-Forwarded-Encrypted: i=1; AKwUvBwD3IDcEA4pAaI8mbbpdoN25Ey8VCwpY+7xaFW2qgzeUSkZuwG50egdcwYXlUfNE2RpM8W8Be81Q03aHgo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlH6xK9CEETeO6ko6q2PWyb4st7M5QnJeoH/syxXHd4O4rRUH3
	A7rIInLa/rH/ynk/n5//zqVee/gBztu3b86vdncZgcYYjD+6VV8QBg7jvuFTGyMJZw==
X-Gm-Gg: AYBFou1wixAK1h+cqdgUTtiyUtGYTo+Q2FuRiekex15O9vYoejB7iO2hg/qOKDJ2SVw
	Q5RWcUNk8zMHwLQJ3ayy1y2NWifRFThgSwUadt8DEmXis2CdDAlqIrwMj3cOuU/D3frLcibmgJJ
	WfGYr/M8XmO0qqaoCTtZAy4ThT22ml1ZxC8X1mCz3QzHw+zg2TXyOJZP1QBQLWfPCS8zOKPeiuy
	In39ks5HIIrmCrA9xN66qD4spL2bmBjH5ij45VP4TSjpZsr28v57sOtNc90T9J21BJhDHiHZG5J
	yssXBbeRTRmkAvj7M7nOCTJ2Ix7d5qyugvgo0e7k5w966Klgd5Qo1C/uvW78myF/HFEfwqaAjFs
	09McxFclaOBQbmHJx5NYSQ7a61A2BrQQxDxHX+f+RxjNzwYEzrJKj0aIubGSnXqSqaGBzvod63j
	bG3JX63fHl63hRGEbXHtA1u1Mh6CkShRHOaGgeisCwtIMMqrtCNZZy/3K6P9gTKejCECGQ3PEHh
	awAYGFPVSfBysehj0t++NjSCGLYHnYFrmmb8OAh+KpDv28QS/vTdLMMqnLUyEXWGHJQmfwU1Bzm
	wEvi6sk=
X-Received: by 2002:a05:600c:34cf:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ac150b3d01mr239787765e9.2.1793625076958;
        Mon, 02 Nov 2026 05:11:16 -0800 (PST)
Received: from hamza-PC ([2400:adc1:158:c700::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm439341455e9.3.2026.11.02.05.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:11:13 -0800 (PST)
Date: Mon, 2 Nov 2026 18:11:09 +0500
From: Ameer Hamza <ameer.hamza@truenas.com>
To: Alexander Aring <aahringo@redhat.com>, 
	David Teigland <teigland@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	caleb.stjohn@truenas.com
Subject: Re: [PATCH] dlm: don't set RSB_MASTER_UNCERTAIN on rsb with no master
Message-ID: <auiKrrdwZbPhZamy@hamza-PC>
References: <20261019151627.3324886-1-ameer.hamza@truenas.com>
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
In-Reply-To: <20261019151627.3324886-1-ameer.hamza@truenas.com>

On Mon, Oct 19, 2026 at 08:16:27PM +0500, Ameer Hamza wrote:
> When a local request reuses an inactive rsb, find_rsb_dir() sets
> RSB_MASTER_UNCERTAIN if res_master_nodeid is not our nodeid. This also
> matches an rsb that never got a master (res_master_nodeid 0, res_nodeid
> -1).

Gentle ping.

Thanks,
Ameer Hamza
