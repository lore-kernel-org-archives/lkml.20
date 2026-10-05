Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C981F192E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 02:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791253310; cv=none; b=QcgZHE/6b7uYNt0t5Iuo7C4qy9EplhmXv7P3no1ID/ixH3Sh4zoazN9st6/R7nb7nllQK58tAEn1XBmbo0LLYYOrYnSRCM6tQMDPEFXZqsH4x2DQkxwYzBDCbSEYwyYRzIA19W+o3lF8e8TQjnrsBLwCW+X4Di6fnsXGlaNRCN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791253310; c=relaxed/simple;
	bh=X+ApK4aJZtFExDbkXvaDoXYcLNfzIgduLawtL28y0aU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hdA8hi+dr+r6C6e3cU0QAN/GctNnpktwrXPwDBacQ003TmOedK7nbGPTbfuz7zd7ju7IdtPrt6agIw14aKpIWeL+53/jA6pCWokV3ppFHbnGL8sW8jDZLLOUOiGh7MjY/pC+ieL1/SBdK7XTzngitIR6cTU0GPIF0LN/yx+R1Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URkQY5Q7; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URkQY5Q7"
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e497ed2ccbso11575195ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 19:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791253309; x=1791858109; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yHf9jQyY1fl7nbJNPZDapSRASsYMYa+IT9UPrDjnf0A=;
        b=URkQY5Q7Jua73dZHJIBl14Xsm5VJmY10W2KjRDJGtQKd+LHmX0yNg2JcElqyPN5Wtl
         AVespsUFjIYUvMGjTYxizg3IBqaEwxTQ2fCrMqzxRQIlFQnkLl29z4jN05WLggZLMrTq
         V6f51hEaCPIkhAEMqyaVVKZIaty9e6xA95mhp+pCq+cBO6+2s1xvxriZtQgyZsAxpa12
         UHrsLuBO7LpLNXWQoHyg03rN4JJ3xey3gwiPRkNm+fjpERaAKkwwM6+S+pyxlt6cx16h
         NtUXLxZ6FJwCemWcrzUKT9NF+X/NtNAhMcg2qPhh0MJEKQefQ7YlzgO9z2BznRcq26JR
         82iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791253309; x=1791858109;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHf9jQyY1fl7nbJNPZDapSRASsYMYa+IT9UPrDjnf0A=;
        b=zTCG1s7kdoqfYrzAdz+bLSLJFCcyh37olEV+D43g0mcIV9cgCkmcEkCGzn1Fl/45WQ
         USZe6QDnYPhuTb+2c+Ac0Yo0GJC1FuojlBU8X9HQpdiP26ukY470Bf2SjurNBYrnA5hv
         tklp1kuwjyt5VkIlTUSjCQ2WokM0oxk0LaSSc6CWRuA8KEgYtbov8letKus9NDdK/Ca6
         Kx6lLUktiH5AYY0gbJCNORINgY2gf6HEaM7ElGJ/kMycsjj3oF5h6FQlrkbxYfIGXYD5
         T8Q+dRXpxo/lEDiIqO6byJkHH7yaTw7rKtwzu5/Oc9QU4FLN8kOvmzLzq42cRYAMCPQS
         StKw==
X-Forwarded-Encrypted: i=1; AKwUvBxZIx0FxxZqqiFamTsdS3D6t4pHLrVe7YJ6sHr/SBLv2jXYDePsMnHUWzBsRn7OlW5Ckkpp0SO+IrIi6Sw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2I3aTevrf381QhLU/c13L5XNRa+FqEs7QrTPFJhBOCkj8IjB2
	C4IIHEsFshvcbuwjDGAEQTY+gkyaLs9T6nw4/mois9dO1BhNZWLsT+2i
X-Gm-Gg: AYBFou1nqYsGY8HaOCFnCP8l7DVKUIoJdtoUOdtSK5YR0c6y+D4eToUuG+FPitcuIYY
	5/nWeQlHPjs1BHa10iCo8Ucj0+zAEY1QcCGjIl2OCcjv12yJnQNEkH02HUmzoZug97ROY+dLi3F
	rSd5PnMTNWm6o9RS39x/3q0QEljt2RHd0JbVybWrC6VfE0Hn6k55MSmQfBWjbJwJ4dsu4X0LAjg
	od4DdjKE6fsrNPb27enHyPrBdSal4LS1oJ7k+rjxrnGiLSjpHOcx65Py57HT1YTn6g4pkD2ACQW
	UhaK+PQK1LQpqsl6qoI/FjigzOSANJdWWnZbZq3UJqQNqvwhT/O/nW32Gq1+/y5/YEF6i0/Pxq3
	drS5rU2JLW3sQT5Zb73z5PnR8wTKteFK9oAuBF/ZcOsSWPwhWUF5W0+QGUnPWaDZuucMcLfmSmt
	LIkvbZ8uBGrN6/ne5FX8dDCQ+Ku1g6/jUcyOfVcTe2yOngEnbjQqL/cy2AB8n7mJQKYVC9u6dnn
	dSNNYTcXY5OO/34Lq9tZYZGoRfDLyC59YQpGr5pa1oygShf6Mt+x+doPFGmgJ9Ejdr7oKfA2Hla
	33g=
X-Received: by 2002:a17:902:ef48:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e5dcdfd37cmr230685ad.60.1791253308790;
        Mon, 05 Oct 2026 19:21:48 -0700 (PDT)
Received: from [192.168.73.37] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5ccdd1f8esm2815245ad.83.2026.10.05.19.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 19:21:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/4] HID: picolcd: Use min() macro to simplify code
From: Aveline Noir <jm5905938@gmail.com>
To: Chen Changcheng <chenchangcheng@kylinos.cn>
Cc: bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org, 
 srinivas.pandruvada@linux.intel.com, even.xu@intel.com, 
 xinpeng.sun@intel.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ccc194101@163.com
In-Reply-To: <20260728025750.48249-4-chenchangcheng@kylinos.cn>
References: <20260728025750.48249-1-chenchangcheng@kylinos.cn>
 <20260728025750.48249-4-chenchangcheng@kylinos.cn>
Date: Tue, 06 Oct 2026 02:59:11 +0800
Message-Id: <179122675117.249704.5624307905971961639.b4-review@b4>
X-Mailer: b4 0.15.2

On Tue, 28 Jul 2026 10:57:49 +0800, Chen Changcheng <chenchangcheng@kylinos.cn> wrote:

GCC/Clang builds, W=1, sparse and checkpatch passed
with no new warnings. QEMU/UHID EEPROM tests passed;
both versions showed the same existing 
atomic-scheduling warnings.
Makes sense to me.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>
Tested-by: Aveline Noir <jm5905938@gmail.com>

-- 
Aveline Noir <jm5905938@gmail.com>
