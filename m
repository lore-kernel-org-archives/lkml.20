Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA81B4138;
	Sat, 26 Sep 2026 00:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790381694; cv=none; b=dYaRJXZx6q9ktrYS6HUQXIaKLrI9aUm0zmGPgEe7/b5FwOkhjOJb4flriUJzN8uIfsclfGu3zoN6+B+tpTS6RZkRkVtN3k65AdCTF6ECxp3hmGcdDnOHuQdqpb73V4nlq1cGawEMbUqruB1xjbw+lyL8heHJ1HHamFS9dY6efXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790381694; c=relaxed/simple;
	bh=73zDcFxCJNmY8+y1oHpRxHe3D5YNjpgRhzJvTA/RfGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoyI6Js8c93Fq3h/ECgXFvnuQNyO5qCFrDvFhAvxKGIse7gc18oQErGUDzk5SwcvbVnG8mybiaP93GsoKfMwZbmLCei/R9jBipem3wnt1+efZZ5jvNo+EDsGjW94rw4btF1i/0OhEI8fmLskUmfLrFeHmv/swxqffzLZ6JBJgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=aSEH92q5; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="aSEH92q5"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4hs7P83HyGzlfvpc;
	Sat, 26 Sep 2026 00:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1790381686; x=1792973687; bh=7v+zkNkjRpE7DXlQVabvCmsv
	fQ88G89t5EZa799eRqk=; b=aSEH92q5meO6DSGVRkkrrugZD86HeZqywTqvzwiW
	uQAuA7VHn2CjXfijYyE/5SSMSlGy6r8b07O4kIY/O1yue5AKOxadHIGNQDU7DFfE
	pGXIIWWvApNqPt7r8LElPdeCIe1V85i95W1jwxirh/eHCaBzGQk20tyVgzYk3KwF
	ibr3bHxFdGzOejjQu+amOtO5Oj/YYlDAMVOHG5exGnon3gYkd4ug2UuvofJ6uLer
	Fx3symwwYxJy+R93SBEDtyUPMFuYunU00ax52G/44Q5yDhVDSRK2D/JAM1wQ82g+
	qqK60bNfgrvjVo3enrKSaZM9IryASnqhein3Qs7oOp7msA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id orVRGeWBoGZK; Sat, 26 Sep 2026 00:14:46 +0000 (UTC)
Received: from [192.168.0.215] (c-24-6-239-25.hsd1.ca.comcast.net [24.6.239.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4hs7Ny6kkczlfvpM;
	Sat, 26 Sep 2026 00:14:42 +0000 (UTC)
Message-ID: <5315b896-e496-4020-9e46-77ffb942ea37@acm.org>
Date: Fri, 25 Sep 2026 17:14:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kdoc: parse context_lock_struct() as struct
 declaration
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>,
 peterz@infradead.org, elver@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 mchehab@kernel.org, aleksandr.loktionov@intel.com, kees@kernel.org,
 tudor.ambarus@linaro.org
References: <20260925234054.128477-1-emmaonana18@gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260925234054.128477-1-emmaonana18@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 4:40 PM, Omokefe Emmanuel Onanaroghene wrote:
> kernel-doc fails to parse struct declarations wrapped in
> context_lock_struct(), e.g. struct debugfs_cancellation:

Has this alternative been considered: instead of modifying
tools/lib/python/kdoc/kdoc_parser.py, apply the following change:

diff --git a/include/linux/debugfs.h b/include/linux/debugfs.h
index 4177c4738282..aa591f0b0920 100644
--- a/include/linux/debugfs.h
+++ b/include/linux/debugfs.h
@@ -233,13 +233,14 @@ ssize_t debugfs_write_file_bool(struct file *file, 
const char __user *user_buf,
  ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
  			      size_t count, loff_t *ppos);

+context_lock_struct(debugfs_cancellation);
  /**
   * struct debugfs_cancellation - cancellation data
   * @list: internal, for keeping track
   * @cancel: callback to call
   * @cancel_data: extra data for the callback to call
   */
-context_lock_struct(debugfs_cancellation) {
+struct debugfs_cancellation {
  	struct list_head list;
  	void (*cancel)(struct dentry *, void *);
  	void *cancel_data;

Thanks,

Bart.
