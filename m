Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5943F3A4508
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505710; cv=none; b=pE3vXni6qiJG2fIQoRiQ6lYKK0S0Axq7phisflhEN47BmpgFJTy1HYv09Ccb4QH9PJRtmWu+o3hhcPknF8lMVG4ft+OiMkJHTefHdhHUQPZZS1x212rATRJ5S+1lzZqhbeGA7ijEVqJhUluvkKX4VuMLgTU4r4gF9LSe4m5UilI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505710; c=relaxed/simple;
	bh=27sO6KtlemkQnmjYUtrvmThL/hqWpjX6SXt72t2Ga4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qt9h/1qBrMyJbxv5XMAldiDW90juZ2D/aJYvlW3L7MWwQ8mVZ5e42Ml9nHXhWjurckoa32nTBq8y2ndFKTiCxSRTEsW3qFtwC0zBh/wjWzQkeOoYOvVGMH3qj4Ua4nQjX8FQgpSAmIC1bQ9/nMf0j4AxnsnDav6yIFo6sAk29Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JNn8bEIE; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JNn8bEIE"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0B3CF40E01F9;
	Tue, 15 Sep 2026 20:55:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LWRL8O1QhQwJ; Tue, 15 Sep 2026 20:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789505695; bh=3YoT3TGOmA6iM0NH3q51imNccFaFqLla52KoQDWe5CI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JNn8bEIE+r+uOc5nlCF8XR9t1THtpb3pS3+DC5TMoTS38dVRoXTnudYR12RmOvPzE
	 wZjU6ReXfJ4rjfBfWNyggA0gjhWGE8HzuC44lmvCOjv8TTZnh33qaqoit4A7d4gMpT
	 d3SHK4p3H9kg4oqA5VqEU5Y45xhSFoJhTj3Aq/NfrBGBym7PD/h4ZkJi8Xj9qj/NsR
	 WyUE57jvnAPtpcQxjWDXu7pdzRk+DHCl9iwry9iMmH5xOzR8/LKMpzeKlRqny0/Gub
	 3zPPbdDhDX0Mp7leoyuiKyHff1jamxdaMKBQMa3jzn+CJQqSO2udMhxhZneK4P07nU
	 XZ/fjFSVfKy79P+XbItjE1QKBNBixXstHUy3oX84SevoqMFDgTa4VnUuED2+aVpnjU
	 wQ9WY3HkFgAgBuNg2iPbipPhemEb2Q509MPEvHDcMCt25IjLLCRrC32YahulohhCKr
	 JMu54pcaWKlHsbF6zSLZX/Mf32BhYPF7gKfDzH68QQCaTPKIH3+z/pNrknyrMHstR7
	 fR+BWBxXOaKQNYQfIs3KQNRbIgeHVMyuLUMsGbxKA0IyzudpEugqC8EAUcZRpU23d6
	 2ba3rRDKKgSEtoWkh21PbJHcRPQPwAbxMz7cqKtehr98DHWbeQt5qqBVnYOSuINug1
	 0P8H92Qb9p6dXVEDwR2mH6PM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 911D740E00B9;
	Tue, 15 Sep 2026 20:54:49 +0000 (UTC)
Date: Tue, 15 Sep 2026 13:54:46 -0700
From: Borislav Petkov <bp@alien8.de>
To: yolezz <yolezz.secret@gmail.com>
Cc: mario.limonciello@amd.com, yazen.ghannam@amd.com, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] x86/amd/node: Release reserved config regions on init
 error
Message-ID: <20260915205446.GBaqmwlpu4BqWluyKm@fat_crate.local>
References: <6bd2cad5-65ef-4f3d-a146-d91f120c86ad@amd.com>
 <20260915180543.112708-1-yolezz.secret@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915180543.112708-1-yolezz.secret@gmail.com>

I do have concerns:

On Tue, Sep 15, 2026 at 08:05:43PM +0200, yolezz wrote:
> In amd_smn_init(), if pci_request_config_region_exclusive() fails or
> if kzalloc_objs() fails to allocate memory for amd_roots, the already
> reserved PCI config regions are left allocated.
> 
> Use a __free() cleanup helper to automatically release all reserved PCI
> config space regions on error exit paths.
> 
> Fixes: 83518453074d ("x86/amd_node: Add SMN offsets to exclusive region access")
> Signed-off-by: yolezz <yolezz.secret@gmail.com>

You need to use your legal name when you sign off on and author patches.

>  arch/x86/kernel/amd_node.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index b7926ba3610a..a1db03d3777b 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -239,6 +239,22 @@ static struct pci_dev *get_next_root(struct pci_dev *root)
>  	return root;
>  }
>  
> +static void amd_smn_release_config_regions(u16 *num_roots)
> +{
> +	struct pci_dev *root __free(pci_dev_put) = NULL;
> +
> +	if (!num_roots)
> +		return;
> +
> +	while (*num_roots && (root = get_next_root(root))) {
> +		pci_release_config_region(root, 0, PCI_CFG_SPACE_SIZE);
> +		(*num_roots)--;
> +	}
> +}
> +
> +DEFINE_FREE(amd_smn_release_config_regions, u16 *,
> +	    amd_smn_release_config_regions(_T));
> +

The fact that you have to wrangle a solution like this just so that you can
use those fancy __free() gunk should both y'all perhaps give you a hint that
not everything is a nail.

The proper fix is to unwind any setup the function has done in reverse order
by jumping to error labels each time it encounters an error. The good old
design pattern that has been used in the kernel for decades.

This way you don't need a separate release function along with a dummy
config_regions crap which is just ugly.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
