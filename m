Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BA94D9558
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789590705; cv=none; b=VmL4W7fN1GmHribpMoPOCqhC3kOFDDaSiZITzej1J9fa+bPQXXEMlp9Iy+hvsVIwM4u596vcZJi0Cz53RNDLiuFw/PMn2gorZWc2abQu8gMGBq0eURks+wPrQYTU+sn3HCa8h32d9xMxyuJZunfIk+kWqp2GSFNwrXDPny+3MOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789590705; c=relaxed/simple;
	bh=vHTBpz816er3NgM5CFqq1xbXEdO0gGI+qmA0dg6RFaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1FWpqRfsTKD9UoeQ3hfzwuqqyoll3yBkSz+tCa+IN/UPkJIkbpAEbtsDcZigk8S9yeKGmrszKGvIq0i2rq9Ehx8F1gyix1dxdkJxNiD4mIRi7mjPckja/a3MEyLjdppHPHTyOAl6mNYLN1fuEep8iaIXjoif0nh0UaQipXWq6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/YUn6jv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/YUn6jv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so713545e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789590690; x=1790195490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gt95AEIXE5Q3pEzVQ3DrhKypjHDBZtZRFc9BAmEeksE=;
        b=g/YUn6jvIa9zbEL0suHJbuT4qF/uLcDkMQC5z7SkCyboqf62dyPzZy1/anYHAUgBTR
         TGMznHoIZcmc7eHBa/jShNMx5Vb5DMBJ8XnX5fEBuiXqIjr/6FLTlffBdYCmeCt4Yfsu
         lFjHNvsIEHRmkzcL3bHD0smCeh/ZlNPW3NCUByGEO6hkFgGyIpU0xW1ByH8UKFBgCpN/
         Wvv8mOtCOxWWiE0MNJ0JK0TDvY7PhPRUZ4CZnhR+zQpBDpJTJbSokeHcBmDXKIQJnOgp
         bOZgvBXuPI+b1NrJmEhEKFHzqqu3E/GKFJq0U3aKJd3LKd7XAlQ0KEqWWbYq/hF0zdUH
         OjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789590690; x=1790195490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gt95AEIXE5Q3pEzVQ3DrhKypjHDBZtZRFc9BAmEeksE=;
        b=RttUwYB3uXk2EiYpDDPB+fdvpJWC0+yL1Vd/CyaDUQ1NLMYQ+Qkce6662VmMvUI6kT
         hGa5jQE2d5sDKoqzUbEe57MnzLfUitz/s007FiM9V9t3ETGhTErqIuBHOgTmdZ1aGt+H
         sEMtYlJiRZ0yRfjJpYX5DehwvpRk2rRvjKIANMn350Ztf2muthmEf0pqBq74CxdFKpZB
         fGE9IK/asdskh8FnVTGtyjHTyTBQVb1VtZ13CzuNVZJqiiNMkC6g1ZGmHsRP9zW4c4BH
         A9Px8T01W6zLeFh+FHhYdH1pDYxCJTH/qsll6ouuyMH1/4VoaQb2RtsHpuu9OsckOie/
         fK4w==
X-Gm-Message-State: AFuF++kG+yiHJPt0zTfZgyrwAX6gB95im2TTJ6WVx0gn1y3bGO8t/cUj
	wgyyPJT1z/ctWFApuXXbW+DOmtDPIJ/Y7Ik5RUTsOxhGJBTIVJB8EpCP
X-Gm-Gg: AYBFou27QKqqyrYQ3zO4aQ/UksveB+eT07vIMJRJEl6AeN2lZoQel/lBwkFw/g8DwtG
	wtVXbc57aUjqjqbApkiHZ+O/gtsHiHcM1av4AH/uLTMYL0mYRUc03Q/weAniIuJGUc58+aG2xR3
	W78nFgEQi/cm0pKb6kbWd5m5jdyFK79ETXGcZjYe7+BaBlfpACEOFpgf/FBKGl/vgKC6HxXMHFB
	6l1+Rr0TQb18CmTx2pX0eGz6S2s3tAn3A5/ICeCt/Kb+yEUqgFWCU8JtoxVpVHZIGsMQPFnGDLZ
	bfTDD98X4F524FXVcwE2t/Xl8eAAWxF1XoQA8z5afp8Y8cpEC3FGuH7cyh5To+CPSvTQ8AiphDS
	XI7FpZHjRdib0N8hMRip3c40G2Sw9XurUGw9Hwy5VX/Klsfjp+e2PjejLg5PSimt6BHT/HmXoUv
	+WVQUAbOmezn45FZDYPcLUYsG+VgFzUsJSWlOEOoeVgBSHVHk2yPBL8cz2O9jgSBisroFE568nY
	nbx5jvf6EUo922niMoL3giDuQ==
X-Received: by 2002:a05:600c:8b30:b0:49e:823a:9dec with SMTP id 5b1f17b1804b1-49eac46434fmr103641715e9.3.1789590690271;
        Wed, 16 Sep 2026 13:31:30 -0700 (PDT)
Received: from andreayoga.localdomain ([31.189.82.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd247809sm26909605e9.11.2026.09.16.13.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:31:29 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:31:25 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [patch V3 3/8] posix-timers: Move posixtimer_exec_cleanup() out
 of exec.c
Message-ID: <aqr8nTMR0XP-ezA3@andreayoga.localdomain>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.680668094@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911090541.680668094@kernel.org>

On Fri, Sep 11, 2026 at 11:09:21AM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@kernel.org>
> 
> Move it to the POSIX timer code and provide a proper stub when POSIX timers
> are disabled in Kconfig.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Maybe I'm being pedantic, but the subject line names posixtimer_exec_cleanup(),
while the helper that actually moves is posixtimer_exec().

  Andrea
