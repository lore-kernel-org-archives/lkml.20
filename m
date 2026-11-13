Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563284;
	b=WAfl9qBL3tfpGSBOyE5G0t4Voy8CmWTi2XqUV0wNY4zK1gpn0iKilzAXXYikxj3lzd81
	 DYEF+LL+2IUJcJLbShfjxdaLUwTFkMWpYMQN/H7N6Gr/rrNFO1rcvJKW97A+xUc8z7L86
	 03T9VRT+5Jiv+qFXAA2p3SzMJ6K8wCzQoo0i9EXLYdozyQMrB0dwAoGt7G8+PdV9yzzjO
	 KVf+oPjfanV3oPrKkenVi6XI8dbgQ4EOuyU0m3M0qEfwQmi5KoVXlrgUPSFt6k1J2mdDr
	 7CqwyXGO2SMdh6jvYY9Orl6YWybrCvnzTzOM1Q+zraWOqPDZ+Lz3dWTE+q5wKIwS3zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563284;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=D7RAxlmN4NPUQ6ePkQH8O+Zj4hlsDkR017+2aD4tTdE=;
	b=Owy+syFT42Z3CYVWuwe27DkDFN09KmSfbHQVxNVOMmg0VKcc1Oo24Bsd/hMwusI4Ek8o
	 vkPHtF4ia9O3fNZ2n+ZcO48ojTqUZBwiaanMW9KWu8R1pbR7KvBcEUcy2pHFKjM5o5fUG
	 L1r5kGgIpLrQWQ2bXtrYHTIMgLK1aHUWgSLk+dC5BbGKiesGFZGyUkN/E7dps8uaEpaiM
	 P4lrQSbg2m1XNEL3YDBleJk6UTottGKTqevqYvA2WDvOSxrtYc/kHdMcI0xAKdy5FnPl3
	 Aq56YKtgxHiUuvCBHnUFe7i+U5Qb8cL5Kmisw1aCgXoZ7fXGg0zzg0pqlh0IvC95suw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYier4+p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C5F606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYier4+p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7F51F000C4;
	Fri, 13 Nov 2026 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794563283;
	bh=D7RAxlmN4NPUQ6ePkQH8O+Zj4hlsDkR017+2aD4tTdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YYier4+pPXrb2JBJEkE+LT8L0EgDz8h1b9darC7vE5gNYl512p8DLKSacTVmskAWg
	 L7UVlDag0SomaevCOGXoWh+gbV9qY88u50R55ueRARSzt3EF7bhrrG90awO3huXR3E
	 FOXGTrVwlZbpRgB6nhIs+ol1cKVfhFSE/dc8cMOobLAaXei6TsCnGtt7PHsxLe66ft
	 h4Go1MyPKA9jrYvDG2g3hqVNAJ1S5GDEQio8yGwnx6VgPmNx5QH6zvXhjnZFU8Au0H
	 HhwCAKJvC3PZ+BewVeZXYi9N/w6Slom6QBBHdUhiC6jttYdNLyIPE/10A81wtt2Xf1
	 rR+Gd1JFBWDYw==
Message-ID: <aa4fecc0-60f3-4888-8a78-64e3efb7e096@kernel.org>
Date: Fri, 13 Nov 2026 10:48:00 +0100
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
Subject: Re: [PATCH] virt: vbox: Do not report user namespace root as root to
 the host
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20261113090758.87172-1-dennylin0707@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261113090758.87172-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-Nov-26 10:07, Hungyu Lin wrote:
> vbg_misc_device_requestor() decides whether the opener of the vboxguest
> or vboxuser device is reported to the host as root:
> 
> 	if (from_kuid(current_user_ns(), current_uid()) == 0)
> 		requestor |= VMMDEV_REQUESTOR_USR_ROOT;
> 
> from_kuid() translates the uid into the user namespace of the caller.
> An unprivileged user who creates a user namespace and maps their uid to
> 0 in it is therefore reported as VMMDEV_REQUESTOR_USR_ROOT for every
> request of that session, although the uid has no privileges outside of
> that namespace. The host uses the user class to account the HGCM
> requests of a session, so such a user is charged to the budget of root
> instead of the one for ordinary users.
> 
> Compare the uid against GLOBAL_ROOT_UID so that only root in the initial
> user namespace is reported as root.
> 
> Fixes: 0532a1b0d045 ("virt: vbox: Implement passing requestor info to the host for VirtualBox 6.0.x")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/virt/vboxguest/vboxguest_linux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/vboxguest/vboxguest_linux.c b/drivers/virt/vboxguest/vboxguest_linux.c
> index 7474bae2cd9a..ff66c00c27da 100644
> --- a/drivers/virt/vboxguest/vboxguest_linux.c
> +++ b/drivers/virt/vboxguest/vboxguest_linux.c
> @@ -35,7 +35,7 @@ static u32 vbg_misc_device_requestor(struct inode *inode)
>  			VMMDEV_REQUESTOR_CON_DONT_KNOW |
>  			VMMDEV_REQUESTOR_TRUST_NOT_GIVEN;
> 
> -	if (from_kuid(current_user_ns(), current_uid()) == 0)
> +	if (uid_eq(current_uid(), GLOBAL_ROOT_UID))
>  		requestor |= VMMDEV_REQUESTOR_USR_ROOT;
>  	else
>  		requestor |= VMMDEV_REQUESTOR_USR_USER;
> --
> 2.43.0

