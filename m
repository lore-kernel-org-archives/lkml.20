Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644140;
	b=XVvkvS9cJUgQ4kzWDySo3JDkajUAgO/GItXla+ZhTnTPx4YvDKu4RJHpHdfd3EDWNNnz
	 vn4N3zbbQlF2qbMgc6Ni8nR63Eh2mBarBtt9eGDUV0iv2tZsFK1EmmikVNkvl8/4EPI86
	 RwBoDW6O1xYFvaotQZGCnMfdGAJw4c0GYW8CLGeEvDS9Krvt2mbX14yAWXgzQ788/6f8i
	 PIjtx+IonOrI9N0Uh4f/+wbJm7VUwjFw7C8erXG6twetgQVfutJXd2kFnDTqpIgFQnG5s
	 nr3umbyiAATJ9T/tsdF9k2cmbYaLRs4MjRGI0uc3sjkY1nQu+s+IjjUxhIC8/tdD+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644140;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=l8M5TVzu7rcAkfa5vXNoXqQRJoYwctXZi+FYrMK4GRk=;
	b=HPCYa/GT+TCxAAisWoHUNnzSg2Zqq+8ILDTMqyQjRxws1GIZWSRQozgHupejk6/VmDbC
	 INEvW7V94mPAizIYySQmB5ZaiiDerqx2mjCGlj7fURY6OXdyYUso+tdOb3cOoIf3LSgHr
	 jO7gGTjHwqZCl7Ew4wGt7CwpsYjlGJ8tL15GfFsobxoZ2Hsltb7ZTeunm5mPx8k4Vb7eL
	 8IeWjrDUO4lfEDR4w+bxyn7kKW3AWYxvISEO4Fm4XLQ6orU3P8S1jhq3Ffs4tJXEGaPj/
	 aDL/zl0AWiavKuVSnJ0f2K1NBXBRm6hTSNrZmECWQdNAmYrZFa74XoCAJkTbAwELFxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ivSje32K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FC2606A32E;
	Thu, 22 Oct 2026 04:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ivSje32K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CF91F000C1;
	Thu, 22 Oct 2026 04:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792644139;
	bh=l8M5TVzu7rcAkfa5vXNoXqQRJoYwctXZi+FYrMK4GRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ivSje32KZJnUmQroLNRCkpwLjJtT3Ol/eXvxtz4Xh4MQwtQ9K0lT7OyUg/ojL0ldq
	 wBY89MRDWiaiG7ZpXARZyPOoFuCqgTGwLQmzg2FQkneJ5pMG/tvjfguQWks80/KqJS
	 B2qyyiAqaJlmgxUuIbWypAreXnqj0N1kecZPFE2I=
Date: Thu, 22 Oct 2026 06:39:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Temitope obabi <obabitemitope765@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: add newline to
 sysfs output
Message-ID: <2026102210-kitty-freckles-0428@gregkh>
References: <20261021233845.15295-1-obabitemitope765@gmail.com>
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
In-Reply-To: <20261021233845.15295-1-obabitemitope765@gmail.com>

On Thu, Oct 22, 2026 at 02:38:42AM +0300, Temitope obabi wrote:
> sysfs attribute output is expected to end with a newline. The show
> functions in this file return values without a trailing newline,
> which checkpatch reports as a warning.
> 
> Add the missing "\n" to the sysfs_emit() format strings of the
> name, vid, pid, intf_id, ip_devices and op_devices attributes.
> 
> Compile-tested only.
> 
> Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Please read the archives for why this keeps getting rejected.

thanks,

greg k-h
