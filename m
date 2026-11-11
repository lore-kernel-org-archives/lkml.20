Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397109;
	b=WJ7srcWRvGXCFDEws4DFJHGimXXhwe3LcZQshAeeemvwX52f2Z3ahTvRCSenu6wjzJhh
	 0clUdBZfMRp6scaEuwnuIudgtxOTUXk2VxeuVMi8WCfZT5l9aCYTRSoXo7E8QhW5WpGuK
	 1/mQzPIhf2rSNhUqr2C8pR+Igz2uTLzTSLEYqN9AlJbxPnOFOyavvZPm6X/pv1vKHRml1
	 7ZXj/YAiU+jGXGitX3WjZrAWqU/dEdN4KbrXG5D3ZTOsFQI7oE9cBYDqkmqIjBEP2tBrx
	 4UDFfqzLpW5giKOEKcfg16N+YKbthKOnpTnz03yUAmtf935M/3jNcVGQNoEy/ut1yMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4fTSg96yjoQMA+V2VPZldNNXe6tjLZP6OX5IOcXamiY=;
	b=ZU6V2lcj4CpgV8RjM8VxUWqRg/5SZ+rMe5IJuO0gMridoFy14SNS1R+RD7jPwGfoSqZo
	 9XdaBcBMCZ9Zm0gVevRCZCSjbvzPd70+FZuuz5St7vCVaHr1Yosh0jBMCgAlUNQ8SQMo8
	 deGAJLFqUTxPBImsfn6rtMZO8T1dYY3AY3UF83P2b9muTIoXxdCxqE5F8XHdsLWqZ0zjK
	 vhSMgCE1bKw6BMoj232wb/Mqg2fSeXSq0fHlPJVU3phbN7JGTZe3mOmLfOfirlQx5fOsG
	 oAFeHUNXRuxMTlsmoMO6jYrLwzpJi8WY/2tz4Ajkw7nJh8HICIWeEuwOQvcbWfkphkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vB/q3lbx";
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92EC606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92EC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vB/q3lbx
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b31ca7e0bcso34030137b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794397107; x=1795001907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fTSg96yjoQMA+V2VPZldNNXe6tjLZP6OX5IOcXamiY=;
        b=vB/q3lbxzaYlSJ1+gXxktaNt86Jwvfy2jDt2MT+T7mKBFdt7mmeMZ53iEjIWNJFvHh
         IIZL0qdkYyYYgN57HQSKr33WHgMlUF00IUwe1XHSHzeZ0vQeq04AS/NPTTYTwXteT5k3
         oE04k47YKh3Ia+VqASIpobwla8xPQLSOThYuRjlsz7yg9lDbex7XBYVdr79DdDVBsJ0W
         +XecGUII5mlSenRVyIIkho2Z+Sg6AHHqWpl5E/qPGEydBtWPi/CySJkw4iUku8AJ8nqX
         3WpXH9hJEeg0qlAjq8gHoZDIvG2F7EpEqpUL31L7CafO6HFFbIROu7KCecTxOatcMbPy
         hMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397107; x=1795001907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fTSg96yjoQMA+V2VPZldNNXe6tjLZP6OX5IOcXamiY=;
        b=FhkK8TAuJBLfu6/h75Zs4CXATlKrNpekAZ1dgSWUJ44hUQhePps5OL9QpKV+0i/tpb
         LNu5JL8I5mcpIKxDvewmpwdhf4L/2kmKi+NtUQWLynlck0LAW0Z6B0/UwAPhs2T3bv8y
         ng0jmqQJxG54bPeEPHDcd7Ce5zelwCCsnGPJ9K0/1gbOhhE8NGexw5Mhn1WJ5OKyw5PA
         rzM0I4YoKGRGNTQPuRS6MRZ+0bdlevgO44Sr6uw3P4Da2zOs5nN05hcpoxEKKss6wjXh
         hNWOwLb+MmXLKjj4V19gN+R6tyW54tsVgKy5ZER5jSTBh8zPPGxuPR1B6WI7r6/bR3WD
         DQFQ==
X-Forwarded-Encrypted: i=1; AL+hErEeTPXCvC0kEMn7q+VnlpMSBzPIvYPlyDJYeOZ5j9JCPrgo8f+0Zaww9s9S22NTeR5ZLcBFo6EFI/FbNCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YkYEIvoRJAUPuiXT2USfSkirYoS8Zq9JbyRcqViHLVCRBQxL4
	el2XOxg+PD9y+2Nw+zO6nspTxFjIpp/1SQxhVTl3gvqnzYF8hMsW6J3r
X-Gm-Gg: AYBFou3ReawOqacl2QBRVO0VLF0O8OPVORj616wZHcpPPmJ9EqBtXjc1KNOhxASsXbM
	YR+G88lRwsh2Gv6dPEx1JvniFXR+r3/LduxGSSixzTLDG/AkykpKpACk2io1UwXnoVSnHYm5MW3
	WF0yZ3Dgirgiqc/r935oo8CZROqGaf1L0lKpUyIoqzbWwe1WGq6QXb68DdjMsH4pnLhHKru0+E0
	ernepZ24cpJ8RTdo6G0xg0E7wlb3ne0iP5Mor8WTCMLeZHhkQB+BGvinDwmUwSsWL6XcT/xhPo7
	Gyw0RTSPXMfioKboeaXG2sfDcCCgjNokBFCIoqW77DSWiesvpfBPDwsy0ViLDtNpzQud7lQUCzP
	ZYuAJB/J7tVNrgSb6YHAzyEHg6mzOzuyWj0KveifyzwQUP4WVgvqrr2NDOwG8wI/0V+ldQF8X97
	0nJOWibHm4HcmtX9906UQSSkgP/Mj6951LPWgIt93o8nCuNGihDiZ0wlOPZgsQH49f7Of/Ue4l5
	vUFBrKwvCX0Dy0axEM1Zg9wDLLbAIjJp+p2uACK5tPUteBbTc2HsVXycAG5TbomgxCD/harkoiK
	4CQ8nQQ41K/6nxFDtVMfg/ApUJ8aP0hOQCPFNEap3hLbRJtHxPHItmr7zP1w5vRyvtvHf6EQhm2
	vUQSVkv1B
X-Received: by 2002:a05:690c:15:b0:8b0:d9ff:4f74 with SMTP id 00721157ae682-8b3a81ce1b9mr20456647b3.42.1794397107526;
        Wed, 11 Nov 2026 03:38:27 -0800 (PST)
Received: from fedora ([187.120.157.132])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm42133187b3.34.2026.11.11.03.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:38:27 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: trintaeoitogc@gmail.com
Cc: axboe@kernel.dk,
	bvanassche@acm.org,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com
Subject: Re: [PATCH] nbd: fix circular lock dependency
Date: Wed, 11 Nov 2026 08:38:14 -0300
Message-ID: <20261111113814.221685-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261111101919.215767-1-trintaeoitogc@gmail.com>
References: <20261111101919.215767-1-trintaeoitogc@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Guilherme Giacomo Simoes <trintaeoitogc@gmail.com> wrote:
> > There is no real circular lock dependency here. This patch addresses a
> > lockdep false positive caused by the missing socket reclassification in
> > the reconnect path. Please change the subject into something like
> > "nbd: Also reclassify sockets in the reconnect path".
> > 
> >  > instead of the NBD-specific class leading to a possible lock dependency.
> > 
> > Please change "possible lock dependency" into "lockdep false positive".
> > 
> >  > Reported-by: syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com
> >  > Link: https://syzkaller.appspot.com/bug?extid=d7d72f3d467710442af0
> > 
> > Please use Closes: instead of Link: for the syzbot report.
> Ok, I will send a V2
What do you think:
```
nbd: must reclassify socket when socket is created

When we need to connect or reconnect a new socket, we need to call
nbd_reclassify_socket() to ensure that a false positive lock_dep
circular warning fires. Inside nbd_add_socket(), after nbd_get_socket()
call he already call nbd_reclassify_socket(). However inside
nbd_genl_reconnect_sock_cb() the nbd_reclassify_socket() must be called
too and this is not doing.

To ensure that even when nbd_get_socket() is called the
nbd_reclassify_socket() will be called to, put the
nbd_reclassify_socket() inside nbd_get_socket().

Move the nbd_get_socket() bellow of nbd_reclassify_socket().

nbd_add_socket() no longer needs to do it.
```
?

> > If the reclassification should happen in nbd_get_socket(), please move
> > nbd_reclassify_socket() up instead of moving nbd_get_socket() down.
> I was have moved nbd_reclassify_socket up, just like you suggested, but git
> don't understanded this very well. But I will find way to get it
No , I couldn't do it :(

thanks, 
Guilherme
