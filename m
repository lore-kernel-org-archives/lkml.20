Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390788;
	b=sGFrWov2PHXwlHymRDxCWfDcAoIaC5mMrHa7RFBA0TNfKo027zzlMHI4jo9L1APtmfYJ
	 epvAqAhep8eUhvVsNwOLJUHap6CwqrzzkYkxHcCaM3Gr5Q3Lfp7YmRViU3TyBcubA94hu
	 uSDFMBRW8i5ucvETWWlXwh128fBnp4FKTb6Dz1pV86cNez1OfPPbM9WEb3cmmEvmP/Fu+
	 4VJqiBJxh8NwrpsfLfMbE56zgBK+v1WzFRJmhxONrDrOwSkc6Jv+2kAKpJqqGxV1ju0U2
	 tMuhDAIBWG+llzootC+ryIUZJ7PsH9y9XGsOwWGE1A6vyPvkqUBRcMYuEL6OdPFIIHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4G41v3Y2fe+OJB6BEq+d1RMvmEUNwaoblh0UBYdzIJA=;
	b=OIGWul/iy9hkW2zzMtLByyQOEmZGJv+1GaM2vuiE+dOPj+/FIrzLUgCTVmHb3EPiE7lk
	 uKHjGC9lfsA7/+BWMwpid8/azX5twqKj+VoDT7RZvczQlmezvFmOU2FSfS4XhOisbrA/e
	 WPF7VaF/sQRMTDYffEJk+4B0jMuSRKFhAXVjtdnd2384pyIKyI5rCUGYhF/8dC5CC6NZ3
	 etkESR1pnVa3sjJu1193s6sJTVlKallCJtYDzeWnmigy2TuggsmbrLn4SyohVqXvwmLHO
	 rthC4+BlgoTF4drqM5BT8AcPrrM2BM6AQSeWt9tzfqcu/1sO9VySZ7XTBl8U71fVH6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=EdHDk4C9;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73219606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73219606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=EdHDk4C9
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36661f953e4so1709934eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793390786; x=1793995586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4G41v3Y2fe+OJB6BEq+d1RMvmEUNwaoblh0UBYdzIJA=;
        b=EdHDk4C9aef8G9Nt63kfsloE7BMjhJajLFLmLjOMPGna3OpmKhqEXihZ0FOVvXx+/t
         NhxNC4+QwUEQeP337y3y+jVCuZ0IH9W/NzXXRNSqD4qb1HlSgOTqmwLjjdAF6UOmv6eE
         A9Au1MNYJ+YZqCa4rP+ZrskfkOs1uNsGvMJ20KCQSmOZqDKTSPMsnPPO67uQPbEXKhkB
         BtbeMuqH9EXcu7t5Ec2kGpEyud4Jh/tzOV5WePx/PM8269BHsOVGDnOrDetvGUuzxrgX
         u+D/1EPzPnbDwM2U4v+FjrEtlNl+s932wzUg5XSLjuS8NZO2yprgDZ/8ibRSzL8vANX3
         Ub/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390786; x=1793995586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4G41v3Y2fe+OJB6BEq+d1RMvmEUNwaoblh0UBYdzIJA=;
        b=PrKYrcI0f/vKTimTek+JHeFNosdDrXTa8pL6j1Ump9WlcySNwzDhcT7OWGpXB/dtWC
         qSsuBS2slct7tW8/dHSf3ZorRRhXHQWaHSAVoEfs+wpFv8rY4HHUPf1z+UlM4mtT01Ih
         Dwn/ACwH1CPFbNbePYhpCPhe1imBKWm6WfvPuIOTCZyI8TYdy+eaWRjeh/+zr+0TlUO6
         y33lRjHt83WApC7iXveJpzvMZmFqK1JgD6bD7NFPhzKj4eomg9QtLjgg0yOvQOEhz9ov
         5Gop7j0IvQEv5DHPwQMMFCs7oSISWupseuZuZIkayAsBihpiGp5dJc4wnJ1Ma+KW4nD6
         QK7A==
X-Forwarded-Encrypted: i=1; AKwUvBx7dwiL6/Y8ekxQ2KTkR1cdIYA//9Em2btg3oYPBvoLcjDP9QLi7dP7sMCdd7tHszZPRtHNkwIXZSgoQAw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSQTeaV7LeFCr5uRkOPbJ8fFbTBGMQKeUFMti35bzJ69txCQlk
	yNlDpSaOcWKR15pGr1S14bqsq+N/rlSQJjebzawtWeNELnfNK+6ciHAbYdX+jJT2lIo=
X-Gm-Gg: AYBFou37asnc6q62MigfssWD86h4zFzG2sV9brEiguOG8FkA5yIPjmlNkJV4pAoHUxY
	Wcx+cdasCEJRwZOEArqQx56fdWm/nHgSOG8+LcLrQ07O3+9k2GLccYvJkqQVHK6SqB4QaCUK6Ph
	sL1CEy4ojcdS6Eu156RgvrQUFOnOlVTwafQIUAWMNrF+wT1Dxx+yJJ/5HBJq2v7cPI/KD89u26e
	vnkqs1qpRGMW1YRVuMUrqRx3jROghs0jn4R8lC4uxNrXJRRifpLwUFd3tgchkBaL5TcDGcKqH8o
	i6MyXtQE8+Z1ffrMWbIH73qZ5nfVNjYO2NrQ1Fs5B/hEh1V9aHzGJhz+1IJEqFRHL2YW5inoYv4
	us+ONuPbv4RvbPOVGIATZGu9E/qEgb9Xc8H2m5Y71aTBNzMj9J1hMyBwLUM1HYuUWJRSHN72s7p
	uJBKMceODRcMshLGDrYe8iz4jj3arzsCz4M+E569BphPn7k4MJW9Rh3LiRHg+QN4z+2Kl918fX2
	BmFliJ+OuqOyR3C0UrVbIfw8PpPq/1yupyY6sUey0+DkDJEM8mieviV2NPRLvvjCQ3XwSUvj6x6
	Y87T0rttnE89rz2be8K03Jzo46vCNIHUdB2DqxsFpjn4m9Htew==
X-Received: by 2002:a05:693c:2802:b0:36a:1008:5815 with SMTP id 5a478bee46e88-36a4220407bmr4672312eec.5.1793390786182;
        Fri, 30 Oct 2026 13:06:26 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm10272118eec.24.2026.10.30.13.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:05:58 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:05:50 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 17/18] nvme: Add support for CQT to nvme host
Message-ID: <20261030200550.GF122209-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-18-mkhalfella@purestorage.com>
 <4459053b-35eb-4359-99a6-05393a9a62d6@flourine.local>
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
In-Reply-To: <4459053b-35eb-4359-99a6-05393a9a62d6@flourine.local>

On Tue 2026-10-20 14:46:03 +0200, Daniel Wagner wrote:
> On Sun, Sep 20, 2026 at 11:28:15AM -0700, Mohamed Khalfella wrote:
> > TP4129 KATO Corrections and Clarifications defined CQT (Command Quiesce
> > Time) which is used along with KATO (Keep Alive Timeout) to set an upper
> > limit for attempting Cross-Controller Recovery. Add ctrl->cqt, read its
> > value from controller identify response, expose it via sysfs, and have
> > nvme_fence_timeout_ms() account for it.
> > 
> > Use CQT to drive time-based recovery in fc, rdma, and tcp transports.
> > Add a fenced_work delayed work to each transport controller. If CCR
> > fails, fencing_work switches to error recovery immediately if CQT is not
> > supported. Otherwise it schedules fenced_work after the remaining fence
> > timeout, which also switches to error recovery when scheduled.
> > 
> > Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > Reviewed-by: Hannes Reinecke <hare@kernel.org>
> > Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> 
> the sysfs entry needs to be documented, with this

--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -120,6 +120,16 @@ Description:
                Shows the Keep Alive Timeout value in milliseconds for
                this controller.

+What:          /sys/class/nvme/nvmeX/cqt
+Date:          October 2026
+KernelVersion: 7.5
+Contact:       Mohamed Khalfella <mkhalfella@purestorage.com>
+Description:
+               Shows CQT (Command Quiesce Time) in milliseconds as reported
+               by the Identify Controller data structure. CQT is the time the
+               controller needs to quiesce outstanding commands once the
+               host loses communication with it.
+
 What:          /sys/class/nvme/nvmeX/cmb
 Date:          October 2016
 KernelVersion: 4.9

Added the diff above to the patch.

> 
> Reviewed-by: Daniel Wagner <dwagner@suse.de>
