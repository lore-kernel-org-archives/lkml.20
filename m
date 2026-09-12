Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB4548EBC1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789237505; cv=none; b=KQ1kBWuas32mrSoYeLY+vsowoYYDVgOGFiupfdbyiQB19fBjG9K2Y7P2ngLQJtNL9zy2sBvNaMPHplvlz0BOeEQNpiXiXSWI9rn5D+e6/K251s9qHhzrEFlxpKze+LSz8whSGXpq2LDzb+dAVdJh71WiUGd3VMWfnJTRgLGk/Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789237505; c=relaxed/simple;
	bh=eLqP1N7b6tjfnDc7NPeEHRrOtb9yw8j+gizAmdXem1A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dCu0FEgFYUxrxuQcAC7Hp3u0BNtNtga9js1RNhKqsrskA1/IVmiJPtn0hoY5FPjwzhM0T4oeXuNj7oB+pcyrWxwx4V1KbiWno0TZ81m3zXe2O4b9x67wRNPi5NqYgI9QRFoRkzbZNRKnJ3H+jbAvi8/bzrGjNp5R/To+4UPGsf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncqiIL6B; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncqiIL6B"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4902427c1so1642757a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789237503; x=1789842303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fB9Rvvh0XNSKgjOKB5u1fxCWt8XLxe3grlwpz5bxPOg=;
        b=ncqiIL6Buw+bDKTaFaF82OO78ETze6aS3xAicjtljmWqfvuLmR21W1ImEcwSCjsiSm
         MVC6l6wOZ12odWCoKEYCQ5TNc+JifQ9b5IlRr8rSCPshuRhbRswrfb30exa0Wphs3O1o
         83iLS13hn4+vcducq1ThHl5n7u7VwguTugYfjwtREUav+/gGAT7EDG3ZjovIhFsy8mG8
         8oANlb0GfrxUfYhuVsr6XNkLrm/GbfOcTRMagfFHrWfSMOlK92yzLPKxU5f1DntbfHuF
         PAABbHucKixjJme5Mk2qBB1sYVZ95CCV9SFUh4pekoC2J7AqRHVwzADWdtfNdtOyKQ/u
         kfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789237503; x=1789842303;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fB9Rvvh0XNSKgjOKB5u1fxCWt8XLxe3grlwpz5bxPOg=;
        b=YvZ8IsqylfCNOzTrPs6kCHDPRv6p4iwCAMOIXk9rSiqMM+qAHgda3LqQEzLp0PbGjB
         fxCce4Judzm2ucXis5kcntwlOUpaZL8QjwWVEDwqfDVi15FF4weGT+C7vmDTJiU/oD8U
         VmiV2577QqSiQkogH/I77GUYejmPm8F7NzYE5pKgAOepC+GgiB0JvbshmBmNa72I+Vu5
         nCkWdTTpmVVshDrc7122Sn8uCK6B8M24XkLE+2GjZ2A5mGo6o03YQtFn9sPhAdgpOBg2
         j5JX9SCOsJlChe+x1hC/a4Qls+X9WD1yh9Mie+gcAcKh/ghuT06i3yUqU32k7he/Fu0Y
         xNsQ==
X-Forwarded-Encrypted: i=1; AKwUvByaAH4pZuW1CG5GUMsUlVyp6NC+mLYNazX/WlkVuxecvsEbU3sLnbKJnYNnE5KfOSfUF3Yq/I9fAIdRZ18=@vger.kernel.org
X-Gm-Message-State: AFuF++k399JMeWr9QYFfhjaHoVQFi9NtmJv5nXaQW+9fpYIvsln7xjTv
	QNdn/bnK2N9TjVZY5JuOK0KxYWF4FXo9U1U5flj9rd/etI6SJst8fhoq
X-Gm-Gg: AYBFou1VbdymsHhYrW/4PtPW/sUlxrGMSyhSmr0h+TUPhToKgn7DR1kjAIQlrwHTZLx
	gqsKgcLXiBw5NMaURezWT1iZaETw0qw/MPaiUTt4YJQbhCbDLoiDHNbrOmG5aMt3Oq1NsE9sjpf
	Tf8Od0sUko4MF/8pNSzkf6/35PkS6Av7BH17FyAWnWpORo265O3xfte7B8zV+dhcoSXhd85Rqsr
	aU7fkZ/Gsqw/z4eARSVsm3CuKM/NwbiLsI3wp696PpJhzKNHNlwSR+KTZz0IZqNWAClls3SKFds
	zBSA09RG2lS+LjCK0oebB/ixyDiHCYwWKLPEd26CeYIFnhCDVZWQwzneIT0ZNBVMo15v50COZON
	oZD847ozJNQoUKQ0WXvvfo6YH3BsnpOdbac1FkHqrncJLH6LpPqdgEsTyxBc+zbEp3ksaUg15uP
	EPIPCB9mlQ5ehTKataJR4MCvlFBRapz1WOWWqmkHv6UheGLbhx0dKZS+HU9P4e4LArNqeuh711C
	IhAnrawr6CV4bjny2NG8U8=
X-Received: by 2002:a05:6a21:138c:b0:3da:11e2:b36c with SMTP id adf61e73a8af0-3dad295a03amr18550192637.27.1789237503261;
        Sat, 12 Sep 2026 11:25:03 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm17018961eec.17.2026.09.12.11.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:25:02 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	x86@kernel.org
Subject: Re: [PATCH] x86/sev: Do not fail SNP platform init if the vTPM cannot be registered
Date: Sat, 12 Sep 2026 23:54:54 +0530
Message-ID: <20260912182454.2292590@gmail.com>
In-Reply-To: <aqJoJBNEpyKpKKix@sgarzare-redhat>
References: <20260821053411.1215497-1-gokul02k@gmail.com> <aqJoJBNEpyKpKKix@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: reply.sh

> I'm opposed convert to an error message, but honestly I don't understand
> which problem we are fixing.

Only an inconsistency: no vTPM returns 0, a failed registration returns
-ENODEV, both leave sev-guest registered, and nothing reads the return
value.  The failure itself should not happen in practice and I am not
arguing otherwise.

Happy to drop this if you would rather keep the -ENODEV.

Thanks,
Gokul

