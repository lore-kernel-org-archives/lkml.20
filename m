Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293247;
	b=rKIZDqbxoWGJtUVNfoLd14BrRMuO9zLRS6cD92Di+KmJjkuLUNW1ypWMnwhX8xJf2N13
	 XVVHEcoAPRXCv7uCQbVh6EHyn8NvFDJ5HhSKiZiBF5H6xnGHeU1dxDFrXcTLcpPL+hthT
	 b8UXXn72r7Tu26NPBCbYrhG2BuskW+elG/pVB3bHAGhyqfD6zVT3oj7qMAapnsNUPNpLx
	 hTOSK+s0E7C5wW0XRV5FuRNXrnzxaJP9SXVxz+8h0iGlvJHkbWhLd3Ymn1vP0IzeBUHz2
	 g35QlYk/Bxqca/1Pgb2Slyg/UFVXQMxwiGM0Ols4jpPiUCNdLK2QZPyse/jJ4vg0THQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZD/qDGi1O6nHsAaexh1x5wdETQZTzQoYlRWPgZIsXpY=;
	b=f/DhQ3j+KbGOJzOSMfcS3aH9cA3i27mf/AFxWn+vVfH4XZImVUXMjqCfiNviu3QaGp8b
	 fRlr8a+81U8IIXvdt5WjxFutQzBwW6wQ9vxeOC0kpUTVSE9IfpP/EaVaeXvdKmYfjnen5
	 xtsNyPlA08p5CQsThXdAUa4F4lPOZyYI+YIBNYzeyUicQe0VGf/QSP1B9aFT+LuC87Dc6
	 WZKQRDE7EDt+lkxqkC/eiXI/CLLKr0B00pGcTEsS0Z3mJqjgbtgIzGX8nUreUqync2ACa
	 7Iwb0SjN/eg2hhRbdATVQiiE6NyVZlf3ZWT1Eo/Xng4EASBsD6oVLAkrol4YucMcEGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="P/ryviEr";
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA78606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA78606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=P/ryviEr
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917a707f37eso22666786d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793293246; x=1793898046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZD/qDGi1O6nHsAaexh1x5wdETQZTzQoYlRWPgZIsXpY=;
        b=P/ryviErdiPh42kReFxkMw1q1mH9fz9TsFFVhDr7/C5Fa2PSoxZUA9NuSEwkEuOkDH
         fNZeVoONCuCJO6q9+z+VTVZWbo0t4PQAZZQbmnCCao5RytIfbF7qM4u0UGfrh8SXqE5C
         1Oy++8U8wu01GKb+uUKj/3+Vr18qQiyVTGVonel5fUq452tyDa7V3ank6XovkMgPdMz1
         b4mfXcw4lUP07SJ9XOoL+xDmONdFYgfmQzR+4w8bOdy6pmffsNZIdJApXGGJQO3JrUXL
         yXzp8LM+iVAhhqSPhoFCJc5loCUVs6wj2cMaSUauBqxFa4vtTkEvYVcrRZ93WpEPiEEE
         wK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293246; x=1793898046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZD/qDGi1O6nHsAaexh1x5wdETQZTzQoYlRWPgZIsXpY=;
        b=xXvdrbamWJ4Vp3nW7rAcJUqFDk8nG4ccJ6yEJzEDNpWA1Bt7x156M422Tq4SerGHfl
         9mgvp/uX2AQPvJYhi9peHzwxzDzC/jdUwhxv+dB9cixlCyJeeDe2oIGFG+XdHbfJcT4Y
         eUIEjqjP/KhdAAO7Se3lJ5uBZl44CtDdenhJRRErKqwO/U3btL1UbFGN2o+KQQ4lokSH
         gtFJgODNpS58t33TVsCfq8JRZCkl+Vz7PDZBX2oBmrqNMq9xHhrch1I3aUC5Webc60jo
         vAeDVH/81Sg2uc53EXQReBlPVJE8ph47VwhHltuoRiZcePMP9rm+AOJBT6nLS9f6ICP7
         wY3g==
X-Forwarded-Encrypted: i=1; AKwUvBxGSTdPDJc9RmEzs/omv3OjWCnrAjaR2ZBQzVDgw9v7Ko/+llgE/OFBEByOC8jsS/cTZ0J0aSuxmXlmniY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPslqe2mo6s2ebtw/bG0o3znDPEI9GJsOEHLf/z2Pf6ARmSmqH
	ubS9m5R0Q7yWUaWjMz9zU+TGYPGoucBADMlXy84gDezHUiYPtcSkhw/QqXsoUhO17Y0wa96AwQ7
	9bkRa
X-Gm-Gg: AYBFou3PSbH8R4UKxtnAsXdySrmSqlVfphOd3c3/z0EX8d+cfWGhqNG22hOEiyKnrhG
	1lkg4PG0goABPjOl+8m4VHVZuZ0op8Iv4l+XUqWj/rF2YLdLZwDTFwMoy2rsmceLNuSIJz8mLro
	A3R6xnbWn7EWqkf/VoIGy3dw67WcnnTvKiV+nwhceMjlZ5oWyAcMJHVNgUe5yyzvVbmihwLR2bR
	pv2zUlVTEdD+l2ZrieAgBxiMvdIBwehfnNQGWWzMFE21ttFid3OvE4D55Xl41lJh5uUg2/LP3J5
	uAgCAsXyhgEl5g1p4CjlGuOw7ES0qL9cwZx1D8uMWMWVeXOHd5UkhIdzHM9fQ4JssSqJN+bDQ6u
	cvzTIWxpov13cE3ZtZo3hLJcZZHJCaZyK9xmtsQAyMEuHDHWLrRZPiI3K2OwLBTiU+QqNmZIYpc
	j/ZXn80D0cHAEhOzIcJz88zdBpR9KVYjy6qwhkuF1xawicpdwsWepyh9dhIyzh9JhGxC0/tQgEK
	Fshn0YzRaPaKt8ZE0ZtPfENCun6gANWNlnY9Fx9So7ml3vNKFXu7nvUFPIQSdwD0ny1oc5Bd5sJ
	Ufukh2tr37nfQYUFEANetsj7fRlUkRWwiOm1liG0bZyWRYm8eEknT52CawHhNP9Pje6vVU3RB8K
	+T7GTWzDU3bY=
X-Received: by 2002:a05:6214:3a87:b0:91c:6e6a:f1ad with SMTP id 6a1803df08f44-91c7cb836c2mr100048286d6.0.1793293245829;
        Thu, 29 Oct 2026 10:00:45 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca317a421sm870346d6.44.2026.10.29.10.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:00:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMTUa-0000000G37w-2g1i;
	Thu, 29 Oct 2026 14:00:44 -0300
Date: Thu, 29 Oct 2026 14:00:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, pbonzini@redhat.com, seanjc@google.com,
	bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
	mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, vkuznets@redhat.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] ath11k: use KVM MSI domain for VM passthrough
Message-ID: <20261029170044.GR1685504@ziepe.ca>
References: <20261029163713.1366077-1-jtornosm@redhat.com>
 <20261029163713.1366077-6-jtornosm@redhat.com>
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
In-Reply-To: <20261029163713.1366077-6-jtornosm@redhat.com>

On Thu, Oct 29, 2026 at 05:37:10PM +0100, Jose Ignacio Tornos Martinez wrote:
> @@ -855,6 +858,13 @@ static int ath11k_pci_power_up(struct ath11k_base *ab)
>  
>  	ath11k_pci_msi_enable(ab_pci);
>  
> +#if IS_ENABLED(CONFIG_PCI_KVM_MSI_DOMAIN)
> +	if (kvm_pci_msi_wait_ready(ab_pci->pdev, 500) > 0)
> +		kvm_pci_msi_get_address(ab_pci->pdev, &ab->pci.msi.addr_lo,
> +					&ab->pci.msi.addr_hi,
> +					&ab->pci.msi.ep_base_data);
> +#endif

This connection should be done through ACPI somehow, and I think
Thomas would expect this to be modeled on the platform msi domain,
just ported to PCI instead of this.

Jason
