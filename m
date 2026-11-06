Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975124;
	b=4XdPPx2A+APMLlg8nPoew37RVol5obnyJTaqI/+6yweY6avbDPq45Ow9iOcII8GGICdZ
	 JkvsZjfSCsuEvooqnJl6Z2RbzXQehlggqYEnL7+UY2xUYEHNK/kc8mLMMmHNkc2xbbDNL
	 GpFHli7WzY1xW0y3+TsseevNifXLi41sO+Vt79Lxi1VPE6Th+dEFSgqFwMjpUjQqHvSlV
	 cq6msSpPYxwKCBoB+3n3SMn74N02gtvQyw1T+WqA37AccVBFW2REDXN9ThRoxRQcy5rcH
	 MUz/tdiDuFWf4CAiQgTiyOzYUH+eOGNRzxIsRKgaKj0rvVXc1Va8SRhj6yDac02VPrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8GouyKlMnx2BsF94DlpxLAYRdV88m16A/IUWMHdfZhQ=;
	b=uUq1s4IeuwxRwYjqCYD1N543VIqXcKC216ZUnCqKqqQcJ1GfVm9LukNzi86jjdMijL8w
	 +zG2HdLdxwD/4uHaNG4bPDaB/nli9fDmxU3PrZ7Glsa3XFDwRUiHV9ZPYjgB1fDNSZKcz
	 2E1cm+Cnv+1/oFt4CSYIBwUPE8vaUbjR4Q195hoqNpWPMoPiyOvzdB4jHX0CpfFitI7hp
	 lwWl2W6qBTza/4CzRWLlES3d7RpQ8CG5/Ar5H4sf3ncbEIoLf+/DuFRyr6YD9IN1ocpEJ
	 d0k6plqLIuuD1g9WAg4dyErCyFes2TQCJAEoy7U+8tISA4HhedTzpeXiSGLd8iHqCSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YExkO1dk;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5FA606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D5FA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YExkO1dk
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1bc97805eso725395e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793975122; x=1794579922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GouyKlMnx2BsF94DlpxLAYRdV88m16A/IUWMHdfZhQ=;
        b=YExkO1dkfFN2/NakXkYr7x3g3z7w3K7zPH80dnyGeAv3mjanaGpJgh7DK9MMEDVGQY
         tfoe+D/xJbJhLaEjqHXyQEReeGYBPYtJ+8BgXDfODg39Jr/dk99j0KbST0hZQsadDU/a
         lMuRk+42mm+njmgQksDxzmI336T7X7jmgVmHqWUKbqT17p4EC+F6fEr5TfKmEPgQcBkt
         8sLr/krgG28arTp9SrV9X3RUjTm1eb1SPUO6q+4VPGhmrsckK7TMGtDHEHNwESGsmdrV
         5DX71f17p7FhCwEw+FZTvPz8luRhr94oNYARBz2q+PXGkwhZGK1N43Sk/bcnqF2mlEDY
         k0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975122; x=1794579922;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GouyKlMnx2BsF94DlpxLAYRdV88m16A/IUWMHdfZhQ=;
        b=2y+6ctgQkkJAJGtHelfWl+RqlSUyXLpharwt62VfSQo9IppRRT84EjQMPkLKgW01gJ
         4M6jE7yyRWv9zr8Tws6uRuUQwI+Ci70jaRbRfzaZJ7Wo+xz2BhaMvYCdRuZi/8QLjfKn
         OShOX69WlI9f31ULXt6Qsg3k2GNLqrsfsJoaWgdlaq/jk+juZtt8XIrq3tA3nVTFTTdm
         Z06lzqinO8y0GXK6HRmfREC8gsHkTCEvPK5jky1kUomMfp8mPvs4Bm8XsMHI0cDtjVal
         7WfK+lifSNxGZTW/VUE7BsFYVO0M19kXsO6poY4WKYok9t+Tj2zmNlKt3XXazILPgWBJ
         IUxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzxrLE9VqPxyKkWXF7dThxyG1ACmT2da+BkjtdZzIg7dQWVu+TEudNUjzHfDPqPXNl+rZe9cdx7NnNHUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6+m9s1nkUR0x2qas36DKlm8mbXktF57Z4aYk5qmgVbAlICnYw
	hGIW0X9YrbXOik+udUwIZ0W0y3ruHcB72nw9qc8Km8DRylmiir3R+FeYejt8jZjYuhk03m9cYDJ
	1zfrRi3g=
X-Gm-Gg: AYBFou0VLxP8MNYocSu9Z/MoZiv7IRwQNb+wNelL/FYF21mW61JtIXa3L8fa7LgMPVi
	iwmogzCSF8oQwmooLCBrnNURzaQFfxtfaNxT6z2mdaA1ZbicYGYJOhPBu9JRBRUqLvc6ODOYpRL
	Ns47Oiqz4u2LnSCbfgBkoHFR2biC3Bi9bJNpnKJ1rtFw+U8xB0o32pxBPVdL/C4edG0f1eH3cAg
	i2AfD/IfDZd/BEuYZ03ecGDl9e1uLzAmjuJ7NjbO3wuXBLM6TIyPGd3kx9Gz4QxL5MgXjRtvA7t
	4Xgi02MC4mFJsvHyruncj24oGirDluUn1LRIYJ7Z8dyEk2NzOl0QLUzTrFlAzGVLyLkh/iBSL+y
	gCHwgjlhR8NI3+d45cu7jwwNdqD8oRF3Ju/TKZUFO5rzACp6W8jvQ6GE5bRNOasusyc9KYT+W5q
	4fby08bKdzdR/6fmpohjbtz96ScxqsU6Aux3xdC39uayPHFoC/8ttmckwFIAx0Q3sGpScrlXWoE
	aYdtM4KN5QCL7RWPuPQjLdkipLHD9FpOdkwzAhOxBvI6os/HHXp4L/yp/kMKpWvQVbegHe+4GEX
	ljfGfa2OH68wZqnobcs=
X-Received: by 2002:a7b:c013:0:b0:4b2:3c81:103 with SMTP id 5b1f17b1804b1-4b6dd268bfemr35458095e9.2.1793975122127;
        Fri, 06 Nov 2026 06:25:22 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4c41eesm10090608c88.15.2026.11.06.06.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 06:25:20 -0800 (PST)
Message-ID: <f6960191-2490-46ec-b44f-b5f92c2cade3@suse.com>
Date: Fri, 6 Nov 2026 22:25:13 +0800
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
Subject: Re: [RFC PATCH v5 3/4] ocfs2: switch dio write path from buffer_head
 to iomap
To: Christoph Hellwig <hch@lst.de>
Cc: joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
 ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105071930.16399-1-heming.zhao@suse.com>
 <20261105071930.16399-4-heming.zhao@suse.com> <20261106105212.GC5746@lst.de>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <20261106105212.GC5746@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 18:52, Christoph Hellwig wrote:
> On Thu, Nov 05, 2026 at 03:19:27PM +0800, Heming Zhao wrote:
>> Converts OCFS2's DIO write path from the legacy buffer_head
>> infrastructure to the modern iomap framework.
>>
>> Key modifications and designs are as follows:
> 
> That's a not very useful style of usually AI generated text.
> 
> If a change is not key it should not be mentioned here.
> 
> As should "modifications" in general - what is changed is pretty
> obvious in the diff itself (and if it isn't it should be made more
> clear in the code/comments).  So what should go into the commit
> log really is the high-level considerations, pitfals and not quite
> clear bits.  The rest is just unhelpful noise.
> 

got your meaning, will revise the commit log.

> 
>> +static int ocfs2_lock_map_blocks(struct inode *inode,
>> +				 struct ocfs2_map_block *map, int flags)
>> +{
>> +	int ret = 0;
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +
>> +	down_read(&oi->ip_alloc_sem);
>> +	ret = ocfs2_map_blocks(inode, map, flags);
>> +	up_read(&oi->ip_alloc_sem);
>> +
>> +	return ret;
>> +}
> 
> This pattern already showed up in the previous patch, why isn't the
> helper added there and used for reads as well?
> 
> Also this and the next one have a very similar diffstat.  It would
> help reviewers a lot if you merged the two patches and did any pure
> code movements in a separate patch, so that the actual changes stick
> out instead of just adding a wall of new code here, and removing
> lots of old code in the next one.
> 

I'll take your suggestions into account.

My intention with this layout was to let reviewers side-by-side compare what
has actually changed between the new (iomap) and old (buffer_head) paths.
Since ocfs2 involves cluster locking, and the buffer_head path has been
running stably in production for over 20 years, my current approach is to
preserve the existing buffer_head flow and logic as much as possible,
introducing only the minimal changes strictly necessary for iomap.

I plan to leverage advanced iomap features to boost DIO performance in
future work.

-Heming
