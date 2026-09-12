Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3455E384CF6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789199428; cv=none; b=jGmIK/EDjaJvINvGD/tm6wY129LnRzJP4qu1TMl6hopyySAEp9kzM01VRGOu3boa3kr09ijgfSjVQrnVOWMIKqJnjNsBiNKgMz/ZwQJxP4h8N4x1NaYLhhR3FDh9OtkDPJs6aZ3G/a2EkI6fDOl8XX0udIcK6FKy4PRUz7xaPRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789199428; c=relaxed/simple;
	bh=bTBk2CBRDahK1Lh12GNmBkGqI1rSJ+RuEfJVc5A7eMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFt8jXUOpishFcZOvqOeh4BjWagUxRig49jV1J3xIWc1ie8er2g2WVqX8zSqzLWcPDpy84JOLsKuL1De7Zd9BNZF1fASxQpFHL3ByPsPcpel3aNk1DGHHABVnbJUfFEBb4DYnNkKIRD5UquWp0Rny5cjUwtpcRzhIr9uDIUZU2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d4ddd179eso5234587b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789199425; x=1789804225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTBk2CBRDahK1Lh12GNmBkGqI1rSJ+RuEfJVc5A7eMs=;
        b=jgrk+kUBa3KyDqsmwtiDuW8ySWQlFQb17F1DPEaxRDCQoPV7AsIowmJ6aal6HBEISH
         7l0q1cHKhpwTtLfpMLjNYgp/AIxAw2wQI/rSRyQ5uRq7PWA2IcvHWLH78HFxHJXIRgMJ
         yg2SKrNbWvyzquZUp6Q+5aCnTB23BUr1C/GC9Wwcv3T62IWqd6J05nvdQ5ovtKNjepOh
         XQENKXX4hAb6+TwBRwen+IZQssXeFZpOjAgn65MHsbXsbmO+a6mU86XzDOj9C9Frf3b5
         aCSYbQVaPyU5p8O4TuhMMXCYaexlgslhIF4zyqUCED6wylLWaJkkG7IvU4a34/mLvqV8
         otDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPm6vLgYLydGE7CjxSkKgkl86qAs2rV+2ydNefBxY59+WEcO+t/0vGFBM0xnApw8IVbV30eT6a9yzXv+k=@vger.kernel.org
X-Gm-Message-State: AFuF++nart/PTh3kPYyZdEOxfkgFfJS/JbBZN6+w7mKMQTdImV4SNKPA
	JPeaq8GdVelNg+hMz9Uf3X5Z9fo4RPJkSTLJLTs+nT2LNh/vHCGdaPnPZ+5/AZyJ/Ik=
X-Gm-Gg: AYBFou39X6gXXPdtGio+j9xh6icJPeKSz93pqhq7tZpSGrljQWBrqOxe4t8IsScoO06
	J90TQslU7txKdubo9vOXVGysNtwkFgDvkFvP40GHG0JljDB7luv3YIhzLEFiuv492Xid7Q4XGVx
	xBDSBVOaSuY9iVMw2Y2Nmj3CJKB4+3aESyV3pdN7YDstVv9Bx/umDzb0J5WSAQIZRbh6sUjJWJ4
	6ZC0tcbFsvKa811mkLk1LnFuLczxmJZzvr0ipLy2IvZ88LoyHQAkh7aCqz9s9IzE2y0HUufgLSB
	uU5jbiETLe6YZyC/BLm17cYHZqoY98dKXIKLmlrxcvREB/f0lwuS7UGh6bDPjZVUIgC2sEHoj7j
	wl64+wA40943Jfgd05X/IxTALathmGSOwqt8PHFRIN3IoTgaFAHFa1J55ZvGhSoez/Bbggpujg5
	qUNjkKk5Y0fCLv3nxK7k0dMYoWY57myMUXViOVVZQobifoD+HKF2hOAJ+XWygAp4VBJ/UUCo58y
	ZfZ0mZnxWSKRjZPcRPRryPrqIygsosZ7lNmD+miIDbtu4LS6Q4jfuRNGqaXMAWF
X-Received: by 2002:a05:690c:e198:10b0:886:550b:c150 with SMTP id 00721157ae682-886550bc646mr13818907b3.18.1789199425022;
        Sat, 12 Sep 2026 00:50:25 -0700 (PDT)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com. [74.125.224.140])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88485f90da1sm19062047b3.8.2026.09.12.00.50.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 00:50:23 -0700 (PDT)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab19127so453025d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:50:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxgHel+skdJLhpscep3SVNGRWsLme0qc4HGP/MMWkijtpPX/S/MtlW0N5xgp0Uz3vJRL1WjWkYNeF2JLn8=@vger.kernel.org
X-Received: by 2002:a05:690c:97:b0:81f:e85b:f9da with SMTP id
 00721157ae682-884b4b01ddamr30061107b3.33.1789199423193; Sat, 12 Sep 2026
 00:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com> <20260905153234.133217-5-tanure@linux.com>
 <aqSX-kUvYaixESxe@redhat.com>
In-Reply-To: <aqSX-kUvYaixESxe@redhat.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 12 Sep 2026 08:50:12 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
X-Gm-Features: AcwNN1V-hZOzugyfoJiJeFS5rmMdeoAyBQ6wZJLEfk_Dvgzhb0zC99WtQCvbVRg
Message-ID: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
To: Brian Masney <bmasney@redhat.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:08=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Lucas,
>
> On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
> > sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> > between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> > identifiable consumers - the three MMC controllers - so marking it
> > critical was the wrong tool: the clock should be referenced from the
> > consumer nodes and claimed by the mmc driver instead.
> >
> > Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> > sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> > have no single identifiable consumer.
> >
> > Assisted-by: Claude:claude-fable-5
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> > This patch depends on the MMC controllers actually referencing the cloc=
k:
> > the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> > clock must land before this patch, otherwise the boot hangs and memory
> > corruption this clock caused are reintroduced.
>
> This series should be merged together in one tree? Which tree? I can
> provide an Acked-by if it should go through the mmc tree.
>
> Brian
>
It's definitely best to keep the series together in one tree to avoid
boot regressions,
but I think the clk tree is the better fit since the core changes
revolve around clock logic.
Could you accept it ?

thanks
lucas
