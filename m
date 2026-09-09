Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0905634041B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929474; cv=pass; b=PbHUwDxgMydfPxU5KqMvMgXZyNfV30ubSj54jXuvaqd4odch9cdpKiW3ATTpsMCdh0PcW7+4VHThNi2UHzKnx7QTXfAHwDJKp9kqcMsu/AQFs0gKbqDit2vSOXDNkW1vf3O/+Vcu2zO0g+40Jbjl7dSE7ouetJXOPowWJiokohg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929474; c=relaxed/simple;
	bh=SHMlaR7e60WLjZys1KqBq2H9AqQjLlKM6AeYANxxwuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPfdsZqbY2fkLYg1x3VCfOek62MjKKWncEUl1AJCGFFvX2QlK+yK2uTPWcNNj5AGO4vKfTZNLpVOCdHxA+5uXjTTlP4eOu8wK+X5KODfx0hSF2aS+RlWNU9b9qvfTkd7wj7ydQcxtPvjZiP9E7JbzVx4g6x1zPd9UJqt8e40ppI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsoNSKSN; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsoNSKSN"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso6145084a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788929472; cv=none;
        d=google.com; s=arc-20260327;
        b=tBMVaYmyxOBX8nIL12roAzhsDhy8AnIhcVwWMCAZGwTwAobWqBqPEJwzkagyHzFbAS
         FFlE3pxzGXO+zBS1n2Tg1HFUiZ05c/dTLDfNoi/W74xygA2WQqWEdGmWPEHok4f46kvt
         UXW62r+CwhzBxozfi4ITft+Hj+/5o3cdHWkgqYmyQxmyKG5wljNY8jcK7IPk4nZLPfTY
         Hia9K0+gYXMtfzBcmiVtVxtbFt6ifisGZxZWNnNxjDedCn5YT2/Q+Wq9eUxbHpsRHMDD
         UDfuDjLnFXK2wojKLiRelMrF9vYmoxnI5QCY6FPM0mfsZURZBUKPPoZ8Z/DWB7DwUQGl
         5/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHMlaR7e60WLjZys1KqBq2H9AqQjLlKM6AeYANxxwuc=;
        fh=wsW/Jj6be9+F0eE76UcsSBzeKVOtAGdmlpm9RtMTvq0=;
        b=DZjm/Xpd7lWcT4y2hXIEbrl94KEIgiB215FF7LVbbZzM9u/lRbuiIJkHSUPviJTnvr
         K4vspJSrSEa2NgydWacXs3Jy0arwJavX9N4T5uMTOhT8Hf3tkiYZJNnTnDMa3u4MOSdL
         Yi76NL7B+tLYWetLD6RDFTQeEdJmDG8JnfnBYyUvDGVSbLNNNAD+xxGxPKc0V16uitFm
         Nh762njIcq2NF+WBQKJi1Jdc0S4Un+a4DOBVIPVBvaaQIbPybhWT7Vw+X0bVKef4PZ+5
         9hUTb+hdDtR8LO8SUWYVPTlN1QyGMXxw2xGO6GYKSbCaoxJIXWYZQ97w2jlgA0ZP7mGc
         ShWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788929472; x=1789534272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SHMlaR7e60WLjZys1KqBq2H9AqQjLlKM6AeYANxxwuc=;
        b=OsoNSKSNUvIVuZsv41WRcdJZbgUoxvytus33wAXJxKJBa62O1EKNGGIm7jtQ1rNfaM
         9ygLEgQRvPnFXmGN9PO08n/zAuaLWLC9k3hnwwtqQkXRWfChQ44Ug/ZnffkPKya/S/fr
         usx9ff3cm2AzLKJCH/u44yNyVcbnWMSoBgJttgcAWPLUJBgC41xOFlxBzy2mtnvtEe0P
         OuRZxStsvPk7Vg3KtVIkp3Jq1tPXFz+p06V1Avu+8k6Kbm+TwV/Ek13vSeQ1qoaruRxT
         UafK46ACkEOj9bIVB4/T39azWCIpcUNiHUBmBk3285soExJuQ1bVIa9DGXtuQjOXowsI
         kYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929472; x=1789534272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHMlaR7e60WLjZys1KqBq2H9AqQjLlKM6AeYANxxwuc=;
        b=R9R5ytwqs3C4JRIYoj9sCu12O2AUDyIgUGG1lW/XQCCbbF0VRVeQ3PSoenQsISWcQu
         E0mCXLHpo25p/zSmYXhcP/ScPPfWKk3ngXdEcrcXijkXuytipUhZXJG3LzfdkPrgpPaC
         fGyt3LZsLDXEVMGLdkyWdDIZJS2olCe3IHQQSTPrpjZSfvbvmnY0ezP/5bJlDXpXttSh
         dmcx/jVFTEC9oojRDUaFld2P5OR5ysfo/A0kftsVvUu/JnAZpVBMwqToUUCV4Igw8crz
         06o5Oi3wWsr0oDL/XAEYDu/Akco5hKZmr5PXh+e0W+J3UlUi2qAZMTHISCtncQQgy3wx
         1GrA==
X-Forwarded-Encrypted: i=1; AKwUvBwdbgmKaJCVWRTIBE3lWz1a0Mv0fC2eDSSTMJYfXs9Txo1BgQNxTHRtdLLSh1GPlZf6qLd+xUvWBW6Fbps=@vger.kernel.org
X-Gm-Message-State: AFuF++mODCo3M3cq90HnUb9Nbvjp9YuSrdCjMsE65/nj33zjIP2Gi+9G
	f4bQ1bmUTbk4pVSXm/UFfJLGDC0XUW210+NerISs9hlTK503vo1H656QA6k5BnLXPPGWIWy1/DM
	lhfsuxcTHIot8v9MJJazV7+7f7xw8Img=
X-Gm-Gg: AYBFou3yN7txwLWlmiobk0IKRZiPr1c6mg/pFUZzEHC/+QrlsHw2tGCx9C6T5qGp3UM
	8O2f27z0X6l/051xHyY/6LIALUZVN9AUlbgqzsbT0skwQA3Vl/5OxU0P8hL6v+uuPtAShUkjmGd
	AyQiz/t9BqrWetz9PkQKw7kguC/ICt7I7n5bagkNZnbmA5R6DaydWd6rAdExSbyd8FN+Mr0npyO
	YUCoJaK5A+o3zZnbEL5Zy8y7CBi31LHrAxPOXhxiMZx2WATM9rVsK3DQW/XBbuhpZeT5DP9Zvj0
	gmc4xMiFFjA1wYlMVHjNHDaiZ9EMuxFWumMac5g0JlX8fR7fsDKDE7SoXF++9GkQItTGurnc4cP
	/uUfb5pTqPJirTKRhnJfgswIk0dXBHYW3utdrmlZR/9IyHD36sBAYumGsqLCJP4slA6s=
X-Received: by 2002:a05:6a21:9102:b0:3c4:396d:4a6c with SMTP id
 adf61e73a8af0-3da39d18692mr53393702637.5.1788929472160; Tue, 08 Sep 2026
 21:51:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903073252.339250-3-phucduc.bui@gmail.com>
 <178880965410.219967.16945994924537630103@kernel.org> <CAABR9nHd-S-3MgTAZk=JMCDEkHjuHqwsE_9h+14tXdhvWdn_SQ@mail.gmail.com>
 <20260908084919.GM40544@horms.kernel.org>
In-Reply-To: <20260908084919.GM40544@horms.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 9 Sep 2026 11:51:00 +0700
X-Gm-Features: AcwNN1XRE5IMlU-W-GlbxFhG9fEet9UOoPLMR7lj76kvZQxj4Z6jKvrR_rWkHeE
Message-ID: <CAABR9nGvQQkjRhpefze24LARK0ZNhYOr2NM=_j_ERifwmmycpw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] net: xilinx: axienet: Handle optional IRQ
 return value correctly
To: Simon Horman <horms@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, radhey.shyam.pandey@amd.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com, 
	andre.przywara@arm.com, hancock@sedsystems.ca, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > OK, agreed, I'll drop the Fixes tag in this case, since this is a
> > no-op cleanup rather than an actual behavior fix.
>
> Thanks, with that addressed this looks good to me.
>
> Reviewed-by: Simon Horman <horms@kernel.org>
>

Thanks for the review, Simon.
I=E2=80=99ll send the updated version shortly.
