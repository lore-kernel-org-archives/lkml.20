Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A11F3BB9E0
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788107090; cv=none; b=V0GwaN5Fm9oVoHApzrBsCHsgfK0MnV0kl+wPus+7k3qEqffVlNukHPbHRdG+uMO2n2VmTsmB7tcVU93AOQqLrQqlnSX2b4IbEJ2HXwDGRKXP7DdkpPBOqD85J/I3i07JUYAoersq/Aov9wBUxVryf6D/wk3RiR0h6eC/8LvtkHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788107090; c=relaxed/simple;
	bh=wd4/Np9BcKgCQVe8dzA/j4ReDI2xnURtUc5ruSckYZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCQGebpRcBpP62PDfmkiQ6g158CB/W/Yuxr1DUwUVSsCYFcaHFsm+IzDKpDu7RilD+x5rtTkLk0JAlP2vY7sCeqynRf5XOc/858OaZjoW/8OwsWYGEZV/g75G0YqFwZXYaHc0Az47W1RAcz37v4ech9vSifa2pFZk4SWXMpxHQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0zqLHRP; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0zqLHRP"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398ba166ce3so755682a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788107088; x=1788711888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uoOcHIFQQdBWhdhIIcmPfZrkUN2MX77IqhljKCPDFs=;
        b=Q0zqLHRPkU/cKQ2pboJU+wNDp9U9QRIfbF1N+vrdYwdw09KvpxCxldeakOZakYUevd
         C2rQMt2P0f5PdDEnVqURuBGCqG2EN7+HCEIndGVUJ4V65XTpA1Ziys4DIC2VoLya4ULy
         lgTxMTJQropDd1f1F8G5oF7w4TFzwPgwPQfjGVIHH0OYNinUQc4ugARsLVqVOooS3P/3
         Ec4MJY/RF86dU2i3fmnP33P9+U5JehNQ+9lebyA8rU+gt4OBYvG8UPs1ErTcZZXJ0mR3
         3j5N5+Q4E4x7E0+Bq1bLopgZSQqW8X3yRcN3gPJ6FXZfYF8eGQjE50AIP2HiQTJtGLKF
         ty3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788107088; x=1788711888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uoOcHIFQQdBWhdhIIcmPfZrkUN2MX77IqhljKCPDFs=;
        b=Um9TPcQ0gzZETbbx16F13Hvf1TnOe4gN49oW+6DrrvbnlGJhfkzD2oOHtp/mV8R0Rg
         4ye9DSgPvpi0ilfHvg1vHtSnZgKZzzWamls1kNoP6GwO/GidFyzRgbrEKEgt+Qz6y2pN
         Fl8TtdHb4dPznp5PTI50XJ+lvTikxvL9uHM9wBpw+H3iptKrJLaE21AJtigdytnvmSF+
         18uiYIMfHKg5rRL1esvQvP9srUDjwvrl6zawbjjzO/6uDtrZpRfCJ6q9NMGEu1+KS58c
         tMOBatkxJcMAkuJLeAN+rrkwah7aCCmreQDUMit3LbfA3SuvAFrNqr7rwQscWVBla3j2
         xybw==
X-Forwarded-Encrypted: i=1; AKwUvBxQOYnBi0tNZnQyqrIfik4KNmDe3yst7agRMR7oSjYjADt2Dc7uqa3RNWSn7oi+J+xKRxyvdrq+iQKR4BA=@vger.kernel.org
X-Gm-Message-State: AFuF++lC/UlCFFCmmBOxbmupyuVMbw/wM94rXnovpJvzvYm4l5WbGTr+
	Ip7v10rC5Tbvyewgwg5s85EAdpoM3HE1hg0gkZQ/TvZROJ1449hFw7pq
X-Gm-Gg: AYBFou1GCANJ6VSR5GKkSZZOl0PC5qL94QfqGszr9YrBhc2ff5Nmr8/OFTvgnffeHsn
	2IxMWJNe7cT1JWRNwiuOBZVctFeZ6tvbqpHP4xkEa3hTyyuIcar+U46PrqsBkN7HwXIybOWpcj+
	nRapz69AYY8vvzRPHLc0HrA1J+VAeZQyji2yOgyK/SuJknSiN6L9T6biv6oLYBso8m3aEXeGrs9
	pk/xeN1lSYFXVqqaAr+MfqYIMLTHhpNHZzHRgaYRC0tSSjQZNX9B0TIJM64TWdDiwp9U+WqaK0m
	EVDuufWH07EKorsKlOLtki7UDLMCJuYGpKIsMXZWcZ0/pOo9GWSMAOf4PuiQxjqmZb87su6w9R8
	gk3wfxhWCnABYrsKfjT6EuabwoISqWeaV7VxQGOPnLkKSsdoKJr+4QX39lR5/ygzAtQdOy/0EIc
	jYun1CJ+SYP11ngDDFkXjqXAPA7Fi9z1gvqhjB4h35/d+9pkYQEBMdy5o7NJ9Jw4ZWPg==
X-Received: by 2002:a17:90a:38a3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-398d6e8ffbamr3534533a91.9.1788107088286;
        Sun, 30 Aug 2026 09:24:48 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:fcb:65b0:addd:e3f8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e907fsm21087126eec.25.2026.08.30.09.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:24:47 -0700 (PDT)
Date: Sun, 30 Aug 2026 21:54:19 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: syzbot <syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, david@ixit.cz, edumazet@google.com,
	horms@kernel.org, krzk@kernel.org, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] [nfc?] [net?] memory leak in nci_send_cmd
Message-ID: <apRZM5ZkGw7KQq4-@user>
References: <6a942714.4d659fcc.734b4.003a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a942714.4d659fcc.734b4.003a.GAE@google.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 73ae59e975966d24e32926247ddb45a537ebe184

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index c7f2afe00b93..7a4094797ba4 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -224,12 +224,16 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private *priv,
        unsigned int pipe;
        int err;
 
-       if (!drv_data->bulk_tx_ep)
+       if (!drv_data->bulk_tx_ep) {
+               kfree_skb(skb);
                return -ENODEV;
+       }
 
        urb = usb_alloc_urb(0, GFP_ATOMIC);
-       if (!urb)
+       if (!urb) {
+               kfree_skb(skb);
                return -ENOMEM;
+       }
 
        pipe = usb_sndbulkpipe(drv_data->udev,
                                drv_data->bulk_tx_ep->bEndpointAddress);
@@ -254,6 +258,7 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private *priv,
                                "urb %p submission failed (%d)\n", urb, -err);
                kfree(urb->setup_packet);
                usb_unanchor_urb(urb);
+               kfree_skb(skb);
        } else {
                usb_mark_last_busy(drv_data->udev);
        }

