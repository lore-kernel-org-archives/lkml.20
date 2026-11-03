Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686832;
	b=vuFSUR7mRhbu4AdSf5wBxyZAie7I1vhzrBboDsn3VYqyLl3w5JLu3lQqAXFqHbQ1vFkJ
	 7ohbbyV34JOQCkm5hq9ZzILEgDSNV+GfZTRDZ+f+xQ8dxQrlS9STBCtaKCPyde4AgDkln
	 EQCVdsnPY1Bd9tfdpIGVqcUIfXu5xG0KXc7Y5KQjcEQfdKaWORvxCUe2qjdyN+xHEHC6U
	 iHqeu3atd52Bev7NYCpDQUpylwFlufe6jSBQg+MpUpzo4TrsgPvpRQUNmvgEg+nRDOFCL
	 muf46Ojdvtc168y2JW+hfYnJQdwH0mYKRpJ/N+H8/qk8fokXwuIn7npB0pVJh8o/Zxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mp3kk8+6LuA0IVceTCacKEe4tqnDRWucOGMN+FIMuVo=;
	b=gYjZkpa3qnBtqrfElLbljG7mihvmxIMBkRi5RnQJVdyzvxBjNaxE2RdrGe6pJ8ox4XsA
	 0+YKputrI3KzjIsr+xn/0/13iJEN/DQHLKnI4oBhhtq6zGLQzVOuZJE21+Etl/k0H6SLw
	 bsw7+PmR5YHDuHYijlK+pLhldUVPaelMpuJVPvpt0yOOjG7afQfFnT1mS03RqDkoe0gYE
	 5MfflEQE0d3oMnrIs+LRgit7eKWgb0ieR7gARkZA7iKEvOOZTjoqwW4ffrBRFwSkINBzP
	 VbdEA9BeKi95LNEbACdu2bZf2HlX2VJEaCoWCAUQIMB/8hwm1snjU9ELmNuj716GHzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AiN34/6U";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD20E606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD20E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AiN34/6U
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso6360528c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793686831; x=1794291631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mp3kk8+6LuA0IVceTCacKEe4tqnDRWucOGMN+FIMuVo=;
        b=AiN34/6UNuFp6NCRELTDRnu6ipyq1YrjuEANuk9cKyie0fgNnQXKo8LRlGVxxRSFH7
         HzACOk2lBEIO78HEXe0WZL5ifvlNM1/GDBAaq8H5L5rncPFG08tOqGTwFcl2En+BM+kF
         0dJkFDOVU0L43ETfA/Sa+7jv7agSh/5AadDf24tJ5TXkUq6DlGo88flab739tJhXf+fA
         vxmWyAiGHaK+g5leHor8wdKuttx9CGWa0t6EnQVWuZVsYl+KomDc3lIqFKRRgZLqgTTn
         VSlaW0YWDy7u1cr4nBIrtzdkKBMCsboZ6ty6wq1+t/NLSRPD1blcdQ+vFfNQf/Pn/seG
         zauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686831; x=1794291631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mp3kk8+6LuA0IVceTCacKEe4tqnDRWucOGMN+FIMuVo=;
        b=mcCLZW/FAVDBle6OEAvCQw+N/ELD5yqn7qSNv9WRl64bLEAmPJny3KCb/ZtfS9TU27
         tXupTzKRNu35qXeG2it57stonWdN27+a1TZJQqgWCAFDLielNnPk48crTKNRS6sbrPw5
         9Ki66YtwMNMNFJU09yq7DflrC2wcnkuoWLCzfxJXLbsLyYWXoO8Rlon92NuTLeBiK6eE
         0LEFKE+AAU85MBSbB86ER4lyj0UmSRW3RT3NbCxoTF50TwXXve9t0oZilUq4AMihs2xD
         CSFWrwUtUmwITe7HKbln0eZPzAKLUAZNpigfE2t8ejQOhqIb9XEdeLXtxyXwtMY+npVB
         Sk5g==
X-Forwarded-Encrypted: i=1; AKwUvBxTeqmBc9C6ecW+Kf7gHskHjpU0rhs3kbT1qF9qgpNIEkVRJxUkGHQIYjvbkg1DpmeIRjSjhOhJ2jTU4Bo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VCkYlLK/y9iKDZ/6ITIdK03mSoZhaLGi5F9X8qjtt5DhTaPsI
	0fFmj+vkZFU+mmUaWB5W63c7VSB5X8+k1YAuj8KaihuA60Dq2gWob3JVxQHPHJ2k/Xo=
X-Gm-Gg: AYBFou2Tyfb+GnZF+RMCEnkLNqFPN0ftlsNYY53HygPcEKcRH/dYibWH/yi7A18oHQG
	BaY7dIAFx/4Sy5A+fQBJcZYGZ3mXNXGJcnTMQo6SCWjp8N77HEPr97DpPcHzfdHwZF/8mcDp/d3
	fzLBB3BqXupGL4Lf5YuxvV7N1BxI2ttXixAlxGr/FPFsCga6nyozhRJV9CQr8ePD5I07FXOAYw7
	2NrrHwPFVOIazlUaFuvClbu+usJgMZzTip2YzU4UpN69wxtMYe7CAW5HapRdUCmjC+MnIknOYHZ
	5SMfC7mDI7AInCMh3FprUrHkQ5PMuWRMkoq4iHiI/YUpn1srvI0of7/GvRDPfM2y/j9cZPJtq1z
	orFFAQJeIHPnNA9C9BlL8C362dqDIWyozJVmFffF8AdTRXBd9/lMWrrP3dzUm1sI92oWzKubuXm
	8pNdQQUsB6I3cRVtp4nRtIqKqE/vyOvp1H16ehHEkYRb7rlQucbC74ADhjv9VPP94/mb7gxP0vB
	k8z5XUyxQQKBeUmWWR6eZh3xdnMGOsPCKvk9KKy74u1vyeKrfftZ+eArGPQfKhF3eHlBo5TC+L/
	96669SyYnSO6AD7lKp8l
X-Received: by 2002:a05:701b:42c2:10b0:185:1640:5536 with SMTP id a92af1059eb24-1ac5ab52fa9mr19515376c88.19.1793686830658;
        Mon, 02 Nov 2026 22:20:30 -0800 (PST)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm39727023c88.2.2026.11.02.22.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:20:30 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	Ming Lei <tom.leiming@gmail.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: Re: [PATCH 2/2] block: set QUEUE_FLAG_NO_ELV_SWITCH under the read lock in del_gendisk()
Date: Tue,  3 Nov 2026 01:20:23 -0500
Message-ID: <20261103062023.2910587-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <44b0d0e5-b14f-4e6c-8e00-16b4af712b7d@linux.ibm.com>
References: <20261102-bug-nvme-remove-ns-async-v1-0-61780fee111c@gmail.com> <20261102-bug-nvme-remove-ns-async-v1-2-61780fee111c@gmail.com> <44b0d0e5-b14f-4e6c-8e00-16b4af712b7d@linux.ibm.com>
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

On Tue, 3 Nov 2026 11:23:59 +0530, Nilay Shroff wrote:
> Currently, there's a patch[1] in-review to change update_nr_hwq_lock from
> write to read while switching elevator.
>
> So the proposal in this patch may not work out if the changes in patch[1]
> are accepted. I understand your proposed patchset but I'd recommend wait a
> bit till we settle with the patch[1].
>
> [1] https://lore.kernel.org/all/20261031044141.5569-1-laveeshb@laveeshbansal.com/

Right, with [1] a switch holds the lock for read and uses
QUEUE_FLAG_NO_ELV_SWITCH as its busy bit, so setting the flag under the
read lock here could be undone by a switch that is still running.

I'll drop this patch, send patch 1 on its own, and come back to this
once [1] has settled.

Thanks,
Qiliang
