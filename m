Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111739;
	b=1l/rjp2yRKjt6pnfnl8uePJOWm9P8+Cv3NO394QsC6fY00Gr4kEhp7L0eOaCS+FJn1/6
	 hvU5V76jTi1IQx2BSWHiGOSEaWO8D6w5HaxEMiLQ53gs9lLSjaeMEHKMB4g+LL04PabqC
	 zxhhAMTaW2GAnHAp2UJANrDqCU5AqQlh1TrF6mO3TLd8CVimyXxi7VKjy9CvscchBtmwz
	 DibFh2Gi+pbQPH/kA1wGzvshazhoF2wbBIhcPZtE9bPjc3cCuBsPwymo9kQGYldlg3nFL
	 IHPTOMTO2QdPEa2+UrxXNFCFOdntWFFAV7+kb885DPLqnD1SwgDdEUo5tVEkmJUPllw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YRBPfEuEjxiSl4lXEqZGK3PF4IiOziovuFu2epJkAlk=;
	b=UTQfMy+i9+o46S1j44Yvm/u0e3CX94XWf2so7Nn5HWpijL94vKocNUz2ghhP6g39zh39
	 LU/is/gGa03nYZ0KZh91CYAg4JGMK5fvJ7EC3oLN4hXzYdw+6+hvzoahgWG/TrLw4fAUI
	 DD2RBWPVc+2JImmkJitw8jK0zLbCSisyTUcOM0NIzLY7SSWqt90XYkevLdZ/reATJm0L6
	 zhNP+bDk6RpMIHJhA862KDazlBIB4TEsf6ZnfZDsNPCfq2z26ALiCgS8NGEKFBQttR4IN
	 gJUg4TqEcBBgjJQc3F2D9t8K+0q8vi7TRaHPKd0QtsNUC4m0LXcCYtQRwIOOJ8nZ72g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MsYbwsmg;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7103606A332
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7103606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MsYbwsmg
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c414e5d282eso502096766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793111737; x=1793716537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRBPfEuEjxiSl4lXEqZGK3PF4IiOziovuFu2epJkAlk=;
        b=MsYbwsmgnWrlRG/PLiwcEoMreSyrMxfs7+Se9WaCZ5dr+QtziecY03C0gAYO6UveLU
         4p4gjKaYahYDet3zYls4IY6BqHbEcWPdztU3/KoE9iGDaOX6Au9xQHswl3m6LEv8RN3j
         KVXTBPvpX4lVgSaL8ODvuLWkA9pLhdsDucc4GAs9wLccH0lw4GmwFZqgaQ58I5fpkIQh
         +swJalxc3bcyIGFIOD9B+8VTLc/GhcfIYxEjiKIMTa07vqb2zS2rIqpDLg8jrv4aYik1
         asabeXOE4D39AiCKtC48hG47cGSjl/xv2/+rHFfg0C0yUvj6kRqrEfXlSfP+HcjzTVwB
         2JkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111737; x=1793716537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRBPfEuEjxiSl4lXEqZGK3PF4IiOziovuFu2epJkAlk=;
        b=Fri9Fv8rHJmLo3NwC2xs0IHaqQDIBl0HnKMwaV6gGE4A4WQce8csTtN+tV87KyX1vF
         hgtiAaMoKKaADYyPjwApqeBEgUcuIol6ht9HIwaXZeUL2laW+KBadpwS/prQXxAIZgHD
         Pp00a/Uf3B6NaW6Y4aUsk1M7gJ260N6SICKv4I37XfOG4WYBJbqfp/FNUqChJemkHGXv
         MzPk8q4v8i1Hc+sCS/lWP3+m1jKwO/vIPmb3ZcQBmPLE8OMgLvmCSagnLofzkeD7IN85
         HDZESdc4FPUreUYn7BOMQJPYcnrd5Macx9KmacNkhfwJBvNzb84ZVvQCDdW2gdPop9M2
         IWwA==
X-Forwarded-Encrypted: i=1; AKwUvBwInY7HETRj6pbYAbw7YWD17zQHRAvgucCnBcg9n9Ul14yu8doewX0OII6zMZvj+YWbxH9C54jWsR1C2KA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjY1aYOFNiu0rnRSvtlUxn5iRu/a9Ys6Z6pSnt/64drK6N9ywc
	rGaOV2/2GgGktwsYB8hMKaJ6bybTW6kOk/1Kxbt7CFKThRn81WhLQomGqp/QSrw4ac0=
X-Gm-Gg: AYBFou1GWUk/ISVvzbPBeWE9e0yAdm63uTNiz+7ejULn9sZ5hb5SNPzWhFanKGN/7j/
	nyA0Qu8rr3R2Ia9Vka4GvR9Ghy4qhJgwRt3c785ePgVHcMpnol/cLJJMb7YVajYyaKCS1Q2oMOp
	Y3fjiorreyR9+L9t/KLJVbmCOnCmmHf+RvbCfud8TF99iRnh7UzM3d32ji/2Co6mmg40+J31FBw
	A7CpTzJpbhAUooyiKNsaSkYzdIIG64Einrr+NItbM93d3JfEwt/97fPnPGwVvk848YEAcFjePJi
	Qi0IO/ykGiEgiQTxuDyDPJRD0fQN7TwdeBuPRno2kowMGQsqyDVFOZbP0OfUOlvlYd3WFhG776j
	nkCnoXyJeKmoYwmhv9PJPYb+NLwv8THvH/e5JyF+5gBO+BPZ+AakkvdNKhgwQkj8PITJd1sBAOM
	yCNNdaw/EEOXSYMEM/4lz0nOg8Jri53ICgzKiqR/37oOvDRzYTHH29shUnWXtMAT3qvN84ZCMVL
	oKwAYgxgEBPxtP+3lrVFvI0a102VqON7TF8tKu/WmftYnFxNg9ER7jCnbw4DXP+Znu/yr7v88P2
	Y4Hx0VsgfW7Qtkkv2BAoghuc5H7dWeLYIGuQg0qXJcKU
X-Received: by 2002:a17:906:d54a:b0:c40:aa04:18d0 with SMTP id a640c23a62f3a-c46bdd971cemr1053838166b.17.1793111736587;
        Tue, 27 Oct 2026 07:35:36 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a7:df01:6e79:f35a:ab88:b157? ([2001:a61:13a7:df01:6e79:f35a:ab88:b157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm23338023f8f.33.2026.10.27.07.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:35:36 -0700 (PDT)
Message-ID: <8469d5fa-2f4e-4565-8d84-43d6b71b4a9c@suse.com>
Date: Tue, 27 Oct 2026 15:35:34 +0100
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
Subject: Re: [PATCH v3] usb: uas: wait for pending commands before unbinding
To: Jiayi Li <lijiayi@kylinos.cn>, Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <20261027131458.983241-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261027131458.983241-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27.10.26 14:14, Jiayi Li wrote:
> USB core normally disables interface endpoints before calling
> uas_disconnect(), cancelling URBs while the device may still be
> processing the associated commands. Some storage bridges may then
> fail to recover after a driver rebind and require a disconnect and
> reconnect.

[..]

I regret torturing you again, but there is a simple issue left.

>   static void uas_disconnect(struct usb_interface *intf)
>   {
>   	struct Scsi_Host *shost = usb_get_intfdata(intf);
>   	struct uas_dev_info *devinfo = (struct uas_dev_info *)shost->hostdata;
>   	unsigned long flags;
>   
> +	cancel_work(&devinfo->scan_work);

No _sync
> +	spin_lock_irqsave(&shost->host_lock, flags);
> +	scsi_block_requests(shost);
> +	spin_unlock_irqrestore(&shost->host_lock, flags);
> +
> +	uas_pre_disconnect(intf);
> +
>   	spin_lock_irqsave(&devinfo->lock, flags);
>   	devinfo->resetting = 1;
>   	spin_unlock_irqrestore(&devinfo->lock, flags);
>   
> +	scsi_unblock_requests(shost);
> +
>   	cancel_work_sync(&devinfo->work);

With _sync

I'd say both ought to use cancel_work_sync()

	Regards
		Oliver

