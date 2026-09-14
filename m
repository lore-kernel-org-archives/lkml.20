Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD047F2E7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395134; cv=none; b=so6KR8WisVG3aeMJrz91QbvVI2NCV32BNHQEt05LU0nFHoOJqCg8qJm+numRbWVPd+yIKpKVUf5ze4mwGPMYg2GOPQyLVndCxqTJARsLuhTi76dPNHZBVFolGtfJceosVnrsSY9lqNoPBvHnAeCtWfY5heS6D5TGnZqxkfZnsgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395134; c=relaxed/simple;
	bh=FYgE/qMDYyeMl2lVwY7dAtgyDXOfNxxwb4+vbhAhdRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BnX9vlutgtqGe2Chm/QsIWpEXSBIuqDk/oMsKSrzbKs13YdaIH5VVBVsZRreDfk8Bwy24NdEPKqBebhL3cvFUON8pRc9R/DV7yd0cnRqhdc5YnsWjSYG4aZsKFYRprw1fWGCUNQD0XzH/5Pu610sK2w/LfzJj+/p+KhVE5WCz8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4MnOGfA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4MnOGfA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso12021675e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789395119; x=1789999919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ucveROnBiD9Bvg19k0xNDw/2fESh5irWztcJl/INm4w=;
        b=C4MnOGfA6THW2WjLmuyh2Z/iXY739+lEku8tmirxGv3aBFMQYNwL7hao5ZkcHr18p8
         Y1ep3K8Z1r26osoboxiApt2P93B8yYJTl9PsXTTe9XJIlTHhVXYpQDtJYXFa5T1R70uG
         P+w06A5E3mx1tUEB99v8++Vfrp1xmZbZEQEiKuksJF2u+bXdT/87I+bhiCDh/zc6sAXV
         J6zZWwX/9KpH3bM+LFIHs8rAbAVkDE2F+rAMDK5se3kPJ2wLyc/VMoI8AaasHVLvJHK9
         pfu7f9PearY403xsBDJnQzsjht5ETXVm9/LNnRZHlyo9jI8kkKCNLRu4MgMlwOhgiKnf
         KwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395119; x=1789999919;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucveROnBiD9Bvg19k0xNDw/2fESh5irWztcJl/INm4w=;
        b=ENwTRfzMDHUiY2hl1Y7040qE6w1lN/otmvjgYrFGqO5ybxjS1oFGd7p9b0tZn3/kLj
         y5JeF3Jdzef/X5sIGC72zAh4VYzxmeKM3Ox4im6KTfEP7m0xBS8+0SOP2qYQypAbJWSj
         bZT/XgGHXlsZwZUHBq9Sm+B6TM9J7jLcpwiCwYJ55dEfl5jFwitvtDPlB1svXKDDCr4q
         ipwEVQXPwR0Rn+CI1OTreB+i5igd8CBpLf19BHbqQ6GauBR0+lX0H4wNcK/qZyl59ZQm
         V9Qc2aagyy3bO20a5/N+tbhYv89TXjWm+QoOqWBeYXW7planFgR4x/4qf2Hf2vNLXKdt
         14HQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc+e3noFbXxk2gbPnKR5X8sUVJ1Co0CBYc+2U9pLMvPTvgVzmLmw0LZi/fCnPW3f5KQpnmnGw4emHmEM8=@vger.kernel.org
X-Gm-Message-State: AFuF++lIT27okcOUywoDn81yVvyei0gckUenwhy6oPhpKIxR2ju7grCA
	v6lx72ZWh/lcZM8UV9C90VbrUsMYOPgraH7LlGYRiC8Te4N0fOuCgxOf
X-Gm-Gg: AYBFou2CSXRUpLqa0FQKD+Z/u5S1osSBpfDsTjNiwhpWjo5+7w8wpjOTA6cNbOv9cwB
	+mppLdrMh7zZjkSya9SKap9edY2Yjmgvtzry44L7xxts7rBdsMKECIXsCp0Y8iDyUAvA8++EycT
	b3i71/r9SIoCjRSq4Irj0ioc3+mzFSriihhjtS0yy8Oj1M14FbqWIVzse5zLKdZ4i5m0oQiHIAP
	dxibb2HJmIY4HUdLLlR1iEJh8zaYMCsvExk+fssAH5Xab7ISr6z6PX7DsXk06k8YZOxjSZ3xXC9
	4Cl6KowXldYvp9wypiH28myqLWbrMdNJiVfvVcJVe88u8sCroPeBrdZ+jOe72rz6LmKZXweJnG6
	yQC5zX0S44pboBYbOSv/XkpLZK1jLoPdELnrBzjQnWGzlGZR9tGnJs6jAkOdB760wF10im+DLSc
	kce5xnuHaxc1FVVlx7Zge/bEMK67G5P+1kj8YitYMg2DxBy9I6Xzk2O08UKHCqgDkDqsvMjuk9I
	ErktsqU7zs=
X-Received: by 2002:a05:600c:3b9a:b0:49c:ffde:45ff with SMTP id 5b1f17b1804b1-49e7a66b656mr33565995e9.17.1789395118802;
        Mon, 14 Sep 2026 07:11:58 -0700 (PDT)
Received: from penguin-ubuntu.lan ([2a00:23c6:6405:9301:838b:b854:bb11:52b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e63c9a7c9sm535965175e9.13.2026.09.14.07.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:11:58 -0700 (PDT)
From: Oxana Kharitonova <webprosto@gmail.com>
To: gnoack3000@gmail.com
Cc: gnoack@google.com,
	jmorris@namei.or,
	landlock@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	mic@digikod.net,
	oxana@cloudflare.com,
	paul@paul-moore.com,
	serge@hallyn.com,
	wangyan01@kylinos.cn,
	webprosto@gmail.com
Subject: Re: [PATCH 0/6] landlock: Add POSIX message queue scoping
Date: Mon, 14 Sep 2026 15:10:23 +0100
Message-ID: <20260914141156.258282-1-webprosto@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821.d42cd4b82f91@gnoack.org>
References: <20260821.d42cd4b82f91@gnoack.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Günther!

Apologies for the delayed reply. I took some break. 

Thank you very much for the detailed explanation and for the 
test program.

On 21/08/2026 09:46, GÃ¼nther Noack wrote:
> Thank you for sending this!
> 
> I have a high level question about this patch set:
> 
> You are adding a check to hook_file_open(), but the existing
> hook_file_open() can already prevent mq_open().
> 
> The following experiment illustrates this:
> * Restrict LANDLOCK_ACCESS_FS_READ_FILE and LANDLOCK_ACCESS_FS_WRITE_FILE
> * Try to run mq_open("/foobar", O_CREAT...)
> 
> Depending on the installed PATH_BENEATH rules, you now see differing behaviour:
> 
> * If we allow READ_FILE and WRITE_FILE on nothing, mq_open() is *DENIED*.
> * If we allow READ_FILE and WRITE_FILE on /, mq_open() is *DENIED*.
> * If we allow READ_FILE and WRITE_FILE on a mounted /dev/mqueue, mq_open() is *ALLOWED*.
> 
> So it seems that the existing file system restrictions are already
> preventing POSIX message queues from being opened?  And not only that
> -- since such Landlock policies are already quite common, it seems
> likely that many existing landlocked programs are already restricting
> opening of POSIX message queues today.

The additional check in hook_file_open() adds a restriction for two sibling domains
created under the same parent. If both siblings share filesystem
access, but must not communicate with each other through POSIX message
queues, the scope check prevents one sibling from opening a queue created
by the other. 

Although I can't say how practical this use case is. I see that it adds 
additional overhead for non-mqeuee files too, but it doesn't seem significant 
as it only checks the inode type and mqueuefs superblock magic.

If you think it's not worth it, I'm happy to remove it.

> So, to clarify:
> 
> * What your patch set is adding is only that we are now additionally
>    taking the Landlock domain scope into account?
> * This distinction only makes a difference for landlocked programs
>    that do not restrict READ_FILE/WRITE_FILE or that do restrict it and
>    then allow-list READ_FILE/WRITE_FILE on a previously mounted
>    /dev/mqueue.
> 
> Maybe this would be interesting to clarify a bit more prominently in
> the cover letter, because it reduces the applicability of this
> patchset?

Agree, I'll add more details in the cover letter. 

> Attached below is a LLM-generated (but double checked) test program
> which you can use to try out the creation of mqueues.  (As first
> argument, use "-", "/" or "/dev/mqueue".)
> 
> What *might* still be interesting to restrict though: While mq_open()
> checks the READ_FILE and WRITE_FILE rights, it checks none of the
> LANDLOCK_ACCESS_FS_MAKE_* rights -- the message queue gets still
> created, even when the mq_open() is denied and returns with an error.
> 
> To expand on Justin's comment in [1] -- it feels that there are maybe
> still some gaps in the "lifecycle management" of these message queues
> that might be worth thinking systematically about, because both
> mq_unlink() and the creation of the message queue entries are
> currently apparently not restrictable yet?  It makes me wonder whether
> hijacking of message queue names (creating same-named queues in other
> Landlock domains) is a problem then?  Do you have thoughts on this?

I need to think about it more and check how the mq_unlink works, taking 
into account the comment from Justin and Mickaël. 
I'll follow up with a more complete answer.

> 
> Thanks,
> –Günther
> 
> [1] https://lore.kernel.org/all/amKDYoOSvHMzVbKX@suesslenovo/


