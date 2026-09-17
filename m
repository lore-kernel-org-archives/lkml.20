Received: from mail-lr2-f21.google.com (mail-lr2-f21.google.com [74.125.230.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8AE4F7CD4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664011; cv=none; b=pp1KVwNNqZ3QbIrGxLVtAihwGBKjFJgpkwNfpqY1HsNYXcWdIpXOXCJgL/SFUK6234zD37nTHlusAfwjeAf3vKguC/IEEzeex3vTS/D2O3o9QcCwPpcKo8gpSM+mUafuthtD5zwx9/BtJalhPpeKXen+xolbiL4HqDkzBk1RvmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664011; c=relaxed/simple;
	bh=55CtH0fbZAzikPsEz6XWao1uKzcG+VvgI4ZlHllnCxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKAqSvYyzCsgHbJHOC8/zwKqs2WAhSndnFhslWeacNJFN+x8qV51wc3fl42caWA/0UhHMvvQjzzfH35+XMZ9GT/3tikcLcMsLt0YEFYDal99MGeprriDF/bnypyKgPS6c99x2TqlT9eHG3GJmDRDO3yxUBKkmRPYuAUATiRydX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPDnFmR1; arc=none smtp.client-ip=74.125.230.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPDnFmR1"
Received: by mail-lr2-f21.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso7946141fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664008; x=1790268808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvabIRYgCeoTg/LgMnCJum3NjuE2OsiV7HRI/rmr7nA=;
        b=MPDnFmR1loiBBxsx3ToDTIQYFErXZDhsM+jPBeEEgWjD8Ei7XxhkrYTUM3cLnMk5W6
         6CKhrejyFn4bwzw4D94N8iM2O8wqVDE45HyFZDRmEIBHMlzP6ezqfE5n+rn1fwjYPOzk
         vlaZOihyLGzarq89009I19lp2KJ9iz7FET9vCquPXMErO7YW0kvv9aV3qherRj6dNQkQ
         70pGVsh0BdkRcTuoz+JK2e+QdOQj+bYFq/rjDlp+a5fTlGPobDQFK+NVvSDfO/pijwUT
         P4PeqEegQ0yDDnMcvhNfa9DHiyBei8u0XJ5eAtpGVEGUIsYnRrDWmUw3Li5z2WSOb6Fy
         qt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664008; x=1790268808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvabIRYgCeoTg/LgMnCJum3NjuE2OsiV7HRI/rmr7nA=;
        b=H9NuNmhPTmGUOJ230uUMg5ylEbhHpY4jLX+4kOVtTzZ5epRUnASSlwBy+iOg4XMGna
         ZhgMrXKRWmip6seGFPLZQADBEpY8TVBsnhglHspU89C0tPUXGL0+hWRWDkRRUKQSDenW
         YyUuaV5P/NQc5bIT1j6sfLmab+YHxjtSiro8ZTf9SN86y2B/an62XAfRrJ+ic87yka0Y
         PYzBwJqjdzz5Iis2aGnmheiIffljaS1oP9xcfxbCtsrI1q/84qu6sVFEyqSUc0e+f6kG
         PTNzW/Kc3khjRMd0tgFlQRV8Cwr8SKUkZwJfmGTn/Z1+l+njE8Rt9er4dKuUWaX+nK1E
         UU9A==
X-Forwarded-Encrypted: i=1; AKwUvBz2KcvGiUZPS98RcUI5vMK1/dNs/+Lsuufjpxg2uT4V4dGWBy8HPpbHll4tnyDHC+KE2N5ugqfLM129pqk=@vger.kernel.org
X-Gm-Message-State: AFuF++nOV4xl0oIEys03F7XmMpMVZ8RbAUlma3Z6QVWYg2ws4CR4RJFS
	PJncDH65rwYnzkOiSWQx17axV6yXAKwL1M2h/fUydkuHe7FwliLO6a77KtQCKNQc
X-Gm-Gg: AYBFou1Wdn8q4m8VtZiLsTmD6Vh7oOV5ez29kUDr8eP5YCeXynSdMmDGu/blzsrtdb1
	IkcrSkYBzAvtIg70NaXqX2akDAennIIKus4IXdChe2WErnbz7bK60IxOhc0PblIWQDhlT7diXRt
	Eo5nOG9Tpr6xXc5De13me3DsrWGV1gQZ0R4xrVHYdi3hIDDJ2iT5CF3hub56wQfvxucVLGJy07b
	HECK/l5lkaTsP3AiGopPaYh2eZAgYdbpd7dLvsw4xvJpI2io/W48dtsYc0GJy1zYc+q2kC7moU+
	H+nHAGClFYc2Zh6hNvWVbWHyROfsSgJtcKny++KOt2ink5HbxxglaC8+22uDgibgfDQtU9N1NDd
	JNTFQUG/aRznUjQmk3aowIpU5b6VKskssrfj3b2Z+VXnmx4PgL9I9XtVM0KYK37KuxxF76GQGee
	WZy1PvXGBj4Dvc6PVulbwohL43bcPlF47+CjAouaiJe+YQ3GhI3WEDqEdgXDxs4VRl4/IGr6wu2
	WuWQQ==
X-Received: by 2002:a05:600c:4e46:b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49eac467939mr79863725e9.12.1789657786255;
        Thu, 17 Sep 2026 08:09:46 -0700 (PDT)
Received: from chicken.. ([2a02:2f02:5101:7300:44c:8311:3d26:e514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbbcf5277sm96906755e9.3.2026.09.17.08.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:09:45 -0700 (PDT)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Matyas <matyasdaniel005@gmail.com>,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: axis-fifo: Added missing binding
Date: Thu, 17 Sep 2026 18:09:37 +0300
Message-ID: <20260917150939.477489-1-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026091743-sanding-shallow-2472@gregkh>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 12:58:14 +0100 Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Thu, Sep 17, 2026 at 02:48:48PM +0300, Daniel Matyas wrote:
> > From: Daniel Matyas <matyasdaniel005@gmail.com>
> > 
> > drivers/staging/axis-fifo/axis-fifo.txt file described how the
> > devicetree of the driver should look like. Convert it to .yaml file.
> > Issue found by checkpatch.
> > 
> > Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
> > Signed-off-by: Daniel Matyas <matyasdaniel006@gmail.com>
> 
> Why twice?
> 

Lost access to the first email temporarily. Should I just remove the original email?

> > ---
> > 
> > Sorry for adding another email. I got locked out of the first one for 30
> > days...
> > 
> > v2: Corrected syntax errors in compatible:
> > 	xlnx,axis-fifo-mm-s-4.1 -> xlnx,axi-fifo-mm-s-4.1
> > 	xlnx,axis-fifo-mm-s-4.2 -> xlnx,axi-fifo-mm-s-4.2
> > 	xlnx,axis-fifo-mm-s-4.3 -> xlnx,axi-fifo-mm-s-4.3
> > 
> >  .../axis-fifo/xlnx,axi-fifo-mm-s.yaml         | 257 ++++++++++++++++++
> >  1 file changed, 257 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
> 
> staging drivers need to be stand-alone, in the drivers/staging/
> directory, please keep these files there.
> 
> thanks,
> 
> greg k-h

Does this mean that the staging drivers do not need a devicetree? Should I just
drop this patch entirely?

Thank you,

Daniel M

Sent using hkml (https://github.com/sjp38/hackermail)
