Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F6D51475D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858821; cv=none; b=PP3+mcotR5pAeqCBkmO5Bj01CN+nSCax2lGq0ENis+AYtHZJAjQC1yZFMTwylZfxR/t78Br/cf3yLwkDsX3FPjK/ihGVk7baNKf8hu0PDc0UzTJrO7f+87ah2DhTXAYr1Oyn39oc0r9ADIyBYSfU1G9DmZEY/wTmM0cGdQRziWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858821; c=relaxed/simple;
	bh=ZJ+IlkBfP+W7OwsYlI5WR9vbKu9M65N9yb2Xb7CKmas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsTJjzgXiu+omI1IGJkDQ245dQTyrCgWRKZxPfhKuoHyJJfh9uI+S8OV8swE926/ycSmWTIyhcBBZwlqNu60PQfSq8GCYlGA/foy9xG0SEjRlPtvtk9ngu0QRwiF9R+MvbGS+HpuQJLSoJ3lVXWzSpphaKh/PoptyuoIEfcxXzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdcxPfiW; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdcxPfiW"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae1f2cedfso8592573a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790858817; x=1791463617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZJ+IlkBfP+W7OwsYlI5WR9vbKu9M65N9yb2Xb7CKmas=;
        b=JdcxPfiWAIpwG2JqDTtH8QoI4y8xya80aLWhyDyi/NfVhy8nil1EkxszIPIzdU81f/
         8tM5P492Sp2NRDxnfOWAyOHjq9WttozpWWtM1hNBxMnTScDAP0JUoO+zGXGDN2fv/8c2
         9emsn2vYb8aKtavdkv6kJi6Wcb6PQ05I1KYUlmi5ig+tm73Ex+9ss9UQPKy/rGWLF7Vh
         G6+J1YPwsd7hScKoJt5/zZqkt3PpgYWggmOWAk8ZqcZnwqTloTpXtC96cUBqWxxhLSHI
         wrtbzrnJWJEEpf0ycP3byd1SAcdpPNvOSa9YnHcpUbW6Lg4L6xeHBCjy98MgGTqUgA+e
         +xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858817; x=1791463617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZJ+IlkBfP+W7OwsYlI5WR9vbKu9M65N9yb2Xb7CKmas=;
        b=xaF7M3HpBk8fyDayxRDMR+EMMKY7fGbHHnd5Wb+iXygLoRpnkR9BWwz6IH7rNtWri/
         5mNd9rLK6VNLTCrwnvVqBFcXkJSyDG+3YJDrCkhfUa62YnGX9HgbHkD1zpBpV9QjYHP/
         V+chELVtAVMo2t5vRDOtKmcwZLXAUhFu2tt+ITbeWdnv5/3DRer7CE85u+TzjRqg/8H1
         0cmKrz58GxH0lw7NIlkRLQTZgiCEmnVt5u2sce9y9Mz3UmU4zVYEGXmHaDl5H0/diTgj
         KwNFSGVyDrHLfZxRJtXLkbIiLu9EHBrpOkdiTOneCIZwBsixLoxrevQUrtHFN3gjJYtG
         By9w==
X-Forwarded-Encrypted: i=1; AKwUvBx68UvX3NERklKa0c2TeZ4ur1gENL2Q9bUF/wRrjxZnQejA2kvgbIfawF23q/hypyAb9K1B+r0dweDnwaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNC2sNDXe3DlpSblQaTGc4BT/99pW+j1Hcgx4buWP5vcDZNMod
	gt+l3ZBFyqgG2pBpH3yc5GTghKGPY1Z6hxxE4kJNcAjbtEz13yyXnop3
X-Gm-Gg: AYBFou2yfAQ5Re61FuaDY0PN22e7Rpq+L+t7IjnFq0m3tGmTjjFgqbwjv4lVocCYZuu
	YG8y/KUgjVjOX3K+9lCTTeCbbTNblsM98QrO5SSOqvfN91/FAibRrfF+klc0G3tL9GWfaZReQTP
	M34i0BEaq9fo0u3N8CIpZdlsMZFeyT2qNjFLRgpU8XPvVf2EbYVXwUjM7+EuqOfY0zIIldDX6ty
	18MWaUr+12JYs9HuE7/w6v4ZwsyW5PtR1ZM2JldB+0NdQhraviCoZQCTtN4O6YjpoP5QM/+Kwn1
	DaPnC6lhxfDh7YKLvBOqa4UFjZwufln2qpcFFbtr9wJXBWdFOwUxivy5bPCj0ysx3P6TYjFfRnk
	xDS0s0oe1rExbg0z0KlA4xnTay26nL8QvRbTA4XBon5Zvjn1w99Ef5kTQa0l6Q3OT4qilAEGz91
	of3usAgM9nzxTOqtGld3MfJyfVAuCYdfTCpjTmtZa/4uJbD0/+YR3U+aoQ7w5QrTDR5Zk=
X-Received: by 2002:a05:6402:304b:b0:6ac:69e5:9f03 with SMTP id 4fb4d7f45d1cf-6ae1992f247mr3075245a12.28.1790858816459;
        Thu, 01 Oct 2026 05:46:56 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af7e4fd2dfsm713842a12.14.2026.10.01.05.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:46:55 -0700 (PDT)
Date: Thu, 1 Oct 2026 15:46:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ronit Gupta <ronitgupta138@gmail.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>, mgreer@animalcreek.com,
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: Add missing
 newlines to sysfs_emit() formats
Message-ID: <ar5WO7BtV7_ygg1e@stanley.mountain>
References: <CAO=9wt733yd9Z6nUbV7awHoQPuu-4eAHWnH10k-OMhRrW1bs3w@mail.gmail.com>
 <2026100118-banner-casing-56e0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100118-banner-casing-56e0@gregkh>

The original patch never made it to lore, but check if someone already
sent this.

regards,
dan carpenter

