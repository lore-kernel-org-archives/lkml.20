Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726801;
	b=YM6LC8AnYCaWsEYsXoU2O+8XgGcorE/KfPdnDcJal6dgArWkYxeGXjwPqUpuE/EHfQXk
	 y92P21RKrKsWR3WZB1fPwcE0lnnd3yLxe9oQXsoGlrNK9nqbZlnAmY1zt3HGUZ5gbKF9a
	 PfabtXJpVEAPvYuCBWys+ZJPsck1aKvVX2CEnGLta30TxteMPgLuSrlSzn2QQSWA+7E9p
	 1bghFy7OQHhgeonqq29tTwr59wCHtbLdkVyjujF5roi058Dk6d/vnbxi+pdTUo6ffkhi7
	 9GKj7UEALf6WTo1aTtWMqJNsdkjEAUini0Mwu6iehjLNIQ2gMnkogRmAcudekMYnJcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726801;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZDkIEFb5Gk29OEqgMWeEXkQGljj5hMlnL3v38UYIlCM=;
	b=F7W4v8njAZL+Hm4jWwmhxb0uwrLMqiUahWfdiaGcNRcl7RZWuKAtIOqMekAo+w5+ikXb
	 w1spibxkr3eaBgEM5T+Ip87Ug4Qt/PwNBm58dTcXYIwOwfCqFLUae2saPRD4viAKcrYWm
	 MNK6gHwUm7umLZ0Z9zd2lw+1DMqs+TA6Q6q3+XLyBMGXmwLym+zkzWAbmgqjPSt+3dYTp
	 TOC3Bmp0qWuJBW3xZXh0Ua/Q/RrGPyD5655JQflpz3tR0SrbppgIIYY1KFMnA9XVp4AG0
	 ebNeYKg88hwm4cClAfd0ypbPOLZ25uWh37CcokrT9F7/u6anIdyM4y/wYT7NrQtulLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7S3Zk1E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E130606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7S3Zk1E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BFF1F000C1;
	Tue,  3 Nov 2026 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793726801;
	bh=ZDkIEFb5Gk29OEqgMWeEXkQGljj5hMlnL3v38UYIlCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P7S3Zk1EbgaSDHJVYb4Y6YH/lAjyxTat7WI54Gz1aLQED+8nAVjtIfec1KU8pFskj
	 UCBVXHWqBNorucT4R2MP9CopXNQnYV4HXRCiRvD8aZvwZ148AvOs0H4UADYtFJZcq5
	 LYzCcPXnNa8/kHqb8VXnKYAiXzWuaRr7djSglhGO0hWi+cfDXWs/nuXwV7vo6/dhsI
	 OGzRa+753ZWLwCcgfbItTjyzMLFce8kn6FgAXaTZjZJEbHFU+DqDQvAuSNo54QAaJX
	 gLvPicswSuyjjyZQL7ymxcHZHOpk3DYluPIGD5vFA4zY4HrTG6yk1UXv6Ax9IuT90E
	 X/6VmhefvaVOg==
From: Sasha Levin <sashal@kernel.org>
To: Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: Hamdy Abou El Anein <hamdy.aea@protonmail.com>,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] scripts: git-resolve: ignore non-commit objects
Date: Tue,  3 Nov 2026 12:26:26 -0500
Message-ID: <20261103172629.1393309-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103164202.129624-1-info@daylightlinux.ch>
References: <20261103164202.129624-1-info@daylightlinux.ch>
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

On Tue, Nov 03, 2026 at 05:42:02PM +0100, Hamdy Abou El Anein wrote:
>git rev-parse --disambiguate lists objects of every type. A unique blob
>or tree prefix is therefore returned successfully as a commit ID. Such
>an ID cannot be used as a commit reference or Fixes tag.
>
>Filter the candidates by object type before deciding whether the prefix
>is unique or looking up its subject.

This also fixes a more common case: an abbreviated ID that collides only
with trees or blobs used to fail unless a subject was given. 117 of the
last 2000 commits in linux.git have a 7 character abbreviation like that.

The argument check at the bottom of the script still counts every object
type, so a prefix that matches only a blob now exits 1 without printing
the "does not match any git commit" error. Could you send a follow-up
that filters that check the same way?

Acked-by: Sasha Levin <sashal@kernel.org>

-- 
Thanks,
Sasha
