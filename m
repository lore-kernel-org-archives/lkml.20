Received: from mta0.migadu.com (out-20.mta0.migadu.com [91.218.175.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145C342C9E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587779; cv=none; b=jcEKFdoWuRyae7l3C35f01i84zPVDEMiY/lOqi19mUlNboPZEhKzC7NV9ZNdt1SU3gpvt85TMX+9BjZ992d8zr+Gk7meGlL7I6x5NJHSqwTzneOHJbSmTIkYixgUV1vcloBgaL76KU8cvkr/TbzgpWKOkTeFhd2RSqlv3cQVNbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587779; c=relaxed/simple;
	bh=mNyW1L2Kl7XsWs4BhSwMHQIYW+aVztuR3efDX2CQxJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L32cHFtj2Uc01APaOD0E0A/mFJT7yVBUEdW4xm5IM+y93wZf/2vfu8LXiR9IiMKH/n8G3QidPsNoe/My/bSt1q/SpUkaAcKWS/l3U65OiONRYurLx5sEUNuJIhT+5vdr0duEUUUyIQxSbMoQ4fk0Z5cmFIk3lVbaMdgTXVe3FQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TnVqrUpS; arc=none smtp.client-ip=91.218.175.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TnVqrUpS"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mNyW1L2Kl7XsWs4BhSwMHQIYW+aVztuR3efDX2CQxJ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790587775; v=1; x=1791192575;
 b=TnVqrUpSi10TgM6NHSsahlF/WLf4OgrlPFTkFcwkvMs9H8AglY3SF6xCdX+DVAAihe8ZU/Pm
 /JZgB7Ms8n6intEieiXuk9b2OVobJ3f89yGEGIFs6yzNtjYxD1VywnnxYazNy/DpaUNoSqw79/2
 xX2LvybbUMGMh9QdjgIpYap8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2cbb19f8d2e023f5;
	Mon, 28 Sep 2026 09:29:35 +0000
X-Mizu-Trace-ID: 2cbb19f8d2e023f5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b8f42bb8a9so4986e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzNCay9KA6TkoSyjpoNBb9o1rkSzJlk1TDqa2+cBTQPesYJYMlQ0rGAS0XAJYwfUAwfkx7oAT+wXwnfhvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3dIl3cLgXPUt0GJPCNvttsaJD/Y3idvU1EY547tCoNz7VMHTm
	mqcXbPjG4hETrZzUjt3RaJa5q2Ex5Ve+Ux4KzFaqeLTkWeawl67aDdMkBpk41ToYF9d6atRR19l
	8ZYTO+GLJNHIyQsY8OMr16a7tmff7aMpbIh/Hvfd7
X-Received: by 2002:a05:6512:3d8e:b0:5b8:c8f2:16c4 with SMTP id
 2adb3069b0e04-5b8ef255fa0mr175606e87.10.1790587770867; Mon, 28 Sep 2026
 02:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064643.3265087-1-fuad.tabba@linux.dev>
 <20260928064643.3265087-5-fuad.tabba@linux.dev> <4095827e-dbbb-4ab9-8610-1bc317aa096f@oss.qualcomm.com>
In-Reply-To: <4095827e-dbbb-4ab9-8610-1bc317aa096f@oss.qualcomm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 10:28:54 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxwffM9vQ0c8MQgsojsXOAUOzo8qD1=aoRK_zGvBF0XgA@mail.gmail.com>
X-Gm-Features: AclHuK9Tx9jSnIhG13zjawNFq0tNHoDD4fS1QJa_ek8GgO61EjctlFamlrJQUSM
Message-ID: <CA+EHjTxwffM9vQ0c8MQgsojsXOAUOzo8qD1=aoRK_zGvBF0XgA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: selftests: Check a feature hidden in
 an ID register is UNDEF
To: Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Venkata,

On Mon, 28 Sep 2026 at 10:20, Venkata Rao Kakani
<venkata.kakani@oss.qualcomm.com> wrote:
> > +     for (;;) {
> > +             vcpu_run(vcpu);
> > +             switch (get_ucall(vcpu, &uc)) {
> > +             case UCALL_SYNC:
> > +                     got = uc.args[1];
> > +                     break;
> > +             case UCALL_ABORT:
> > +                     REPORT_GUEST_ASSERT(uc);
> > +                     break;
> > +             case UCALL_DONE:
> > +                     kvm_vm_free(vm);
> > +                     return got;
> > +             default:
> > +                     TEST_FAIL("Unknown ucall %lu", uc.cmd);
> > +             }
> > +     }
>      Return missing?

No, the loop never falls through: the breaks only leave the switch,
UCALL_DONE is the one way out and returns there, and the ABORT and
default cases end the test. So control can't reach the end of the
function.

Thanks for having a look,
/fuad
