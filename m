Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC0A486E6A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953137; cv=none; b=tfGHAaAFJKbOErLZ/aQdEKEdLG8sX/+HpaUyaRUHlJCP9GVQIf5TyllW778DqOaTZGQWf/xMVuwS6Gcje2hqASXkRtj5JQuHIGBsGXcy0QpzBNb6vZfRgcilIzDlwQnBHQ1Dog8bGksdGOcXBfRpseFy0aAubJvbTez4modr8Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953137; c=relaxed/simple;
	bh=rz1x5L6huLpRif5z+JxzN0AAJWwr/spmpwvDp5Tht3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lq45HPnZPMeXJ/Jy9eh4mz1Nvzb03wIE350UIv9ZMjl+IWkivVQudpExA6ZTcAFXmPmhponoREAZXMKFMmZSFx1ErbRGxvUs/FRoI+tyfvj/MRJsKnNSYyMY3Kvnt0+1OR4jvbTima/zp9IdXSRqHmZDzi4yC3bqbGxn0TCXjCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vs32S8+y; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vs32S8+y"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FA7E497;
	Fri,  2 Oct 2026 07:58:52 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4BBC3F86F;
	Fri,  2 Oct 2026 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953135; bh=rz1x5L6huLpRif5z+JxzN0AAJWwr/spmpwvDp5Tht3A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vs32S8+yFNMUbijWQoexDTe79iCr0dNxBsb04bpvBTqtxrgS/X5p/OLS1vNe9LGTX
	 DExHSeyZ5U1JWxM3NwBE/VMR6KslrzmXV/+KTXlpPB2MY4U0fE0JsVKqfk1gDdXpzc
	 yW/maa7VOzQptGOLi9Mxn8lk8idzx0OfQs5Mr4es=
Message-ID: <23c38074-86c7-4326-96c5-a9a434ec866e@arm.com>
Date: Fri, 2 Oct 2026 15:58:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] arm_mpam: Move MPAMF_ECR write helpers to allow
 reuse
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-2-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-2-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> In preparation for calling mpam_enable_msc_ecr() from the CPU hotplug
> handlers move it higher in the file. Move mpam_disable_msc_ecr() too to
> keep them together.

Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James
