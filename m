Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D9852BE28
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877737; cv=none; b=L6jQRgs3TJJcjo0UmfXCmEGTW5muPWpWnRGVpOhe/4iLgxPMnwY3EkvCnqAMVbrytHHE4uriCjQGTMNbQEt2SlVBY6jNGDlJORmYsrwJsMNraZ84TvehgX/UeN2/F2ey9e9HBmhPTyEfhW3uPVW6N1UBuJ/yx4nTuVgqBHvGoxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877737; c=relaxed/simple;
	bh=QC894VVNFE+QX5jLEROnGftXBpYdqetNtogv05DAenA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYVhcgskGwEr4Ch2qIl0zPS34dl6YUrES1XbfPZdeufr8Ya7RDktkuY6f5EaUoBUFqrbmHBKI8IkTq9aeeE5FFmfBCGbFx6XMuPzQw80KY5NASpuO1vntZwshHFz1k4fI9UJpY10S4Zk7UtV9ck9EVwlU5iWWCyroRInd0QodbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=k14HKcjr; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="k14HKcjr"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66825847b2cso5188796d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788877730; x=1789482530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=acTtdIUeHcaQmOCcZka3aZUMRILgrgFwPSEMa3ata2A=;
        b=k14HKcjr74QXlRGw1hKF9HMrcSQn3Glz8cGK9Q2R8tFoOPPg7T3kS2Eqxn5cLCLb3D
         E1AigHTWA4iPobiMPW+ELQSoEbRhsauiYtRGQLh+mhrNfffPaqIgWTYQNI/Z4ZiHrg6P
         dsGA1AM5rmgO92HJfCPjmccmow8oUMc4aGOXQkc7wnIhH69yzWfR1jWmanvI34nMoGIj
         vp7pMH9XRbwiGKHifvd6LP1re+GDTp4PO5sMTGSIk1uJZ1vF9t3cn8fdK6Cmpb41YpK5
         O1Dl8z7HclTmHajbM/5FofY5uUgtYWyruOVrPIgjO4UKl94+ypyEccczFl7iZFZerwWh
         KDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788877730; x=1789482530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acTtdIUeHcaQmOCcZka3aZUMRILgrgFwPSEMa3ata2A=;
        b=MjT8JkkImGPXOLE+vF4gySj2kpcoKG0lO/SIYW+O8mGf1gw1mN1lZnmcXstAkkXPOw
         1IvNcCHnnZ7m9bfewQ5hLgDw61sjRylPoh2z1ezsmZqLsEVF9I62AhQGlBQ0+wtqHNuN
         9yXxmHhD9VQ1F0P8aPDDpM/HWwqnMxWb7O4nq61V8q/SJfFl+5lKizWy1oQe9rnSd/FL
         u5I/d8mDu1tOh3lcSftk675n5t23NDioPRxk/7SDc+6MMNf+PjNDS8f1eZp7cSB1zmuK
         3WMIn77UhVDFdaikFYqJEIW1TodBVeIRXwl2+A0Z/7q3Pn0+F0lT8MhkTWh3PnHfFzV+
         NCew==
X-Forwarded-Encrypted: i=1; AKwUvBw81bqYoTk+uGrA0I985nhVGgvgnCEghZH3HCkTD95pX7CCRU1HS+caP6KmfeVvFFZgpKmN8hFfkik0yJw=@vger.kernel.org
X-Gm-Message-State: AFuF++lOArb6TgTqnvyuH22XOrgBsPSykAWWqX2RszTfGP0JGb0Hrtkf
	0vv1vHLGPvDpyrOeWEr1q1XLyoEzqiAz/xMtlsi1YopuzXgNTypF9UAMxh7PkBYtbw==
X-Gm-Gg: AYBFou25swixL0/iD5ssSUx+41QTZGurvDunGzc1lfYyiU0TzTT8hMrODfkdYO/WrZP
	zeJ91qld2qLerrSr/PznJnCtGuHoV0uHEJg8P6TNhwlUzbBjZmsEilqBtLtUZNFkJSRIaq1aNSP
	vHatTepOmWEKwjbuKnlChmZPZbiuc30H14uqPAybpbGefmS5gkN7LdGyGa6dE8Ve3CPNdpbpocA
	CVuDFN3cIpEoEPPTTJ6V7TTQE+rhyRGkQO6TMZviEPsb/35UHzNjNx6rJ7KDYBd9n/V98QBGrRg
	iV+l+Zor3B5x0UE1gXmmx9VS6C2D4I528bFIi1MTOV3uRZ+DfkqKRJb7qFscOtYwIgBHoxO0MfL
	FBom8ELUzR26A8MsYaeE4NHshknpkk0YmdrRIxoaO1oSXoGgG6g30fVqElWG3h9olu1ejNQTvvm
	wfTCC8+/AXJ5azH+dG8OvVDDHDvFCijBps8hF3hSeorkseBUZi9qOrI60s8CaaSw==
X-Received: by 2002:a05:690e:c45:b0:670:78cd:16f0 with SMTP id 956f58d0204a3-67078cd178emr3118595d50.73.1788877725242;
        Tue, 08 Sep 2026 07:28:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104064a2f8sm118085886d6.12.2026.09.08.07.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:28:44 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:28:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Keisuke Tsukuda <catnyaaan@outlook.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com" <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com" <syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: f_mass_storage: ignore class requests
 while inactive
Message-ID: <142bb935-adef-4881-adb4-f1ba158e7130@rowland.harvard.edu>
References: <20260907085806.52647-1-tkdkei@outlook.jp>
 <20260907085806.52647-3-tkdkei@outlook.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907085806.52647-3-tkdkei@outlook.jp>

On Mon, Sep 07, 2026 at 08:58:42AM +0000, Keisuke Tsukuda wrote:
> SET_CONFIGURATION is handled asynchronously by the mass-storage thread.
> A class request can arrive after the composite core selects the function
> but before the thread installs common->fsg, or while the function is being
> disabled.
> 
> fsg_setup() already rejects this state with -EOPNOTSUPP, but checking it
> through fsg_is_set() also emits a warning. Check the active function
> directly so normal requests during a configuration transition are rejected
> without hiding fsg_is_set() warnings from other internal paths.
> 
> Fixes: 8876f5e7d3b2 ("USB: gadget: f_mass_storage: added eject callback")
> Reported-by: syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=d31109047baed8f3b590
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index a50743c..52d486a 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -463,7 +463,7 @@ static int fsg_setup(struct usb_function *f,
>  	u16			w_value = le16_to_cpu(ctrl->wValue);
>  	u16			w_length = le16_to_cpu(ctrl->wLength);
>  
> -	if (!fsg_is_set(fsg->common))
> +	if (!fsg->common->fsg)

I'd feel better about this if there was a comment here explaining why 
calling fsg_is_set() is a bad idea.

Alan Stern

>  		return -EOPNOTSUPP;
>  
>  	++fsg->common->ep0_req_tag;	/* Record arrival of a new request */
> -- 
> 2.50.1 (Apple Git-155)
> 
> 
