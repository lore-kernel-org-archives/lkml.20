Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4EB4968E0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296016; cv=none; b=BbwUykJVh5sxnVQJXXUI0Uo5fTje+CPaHsSVBMjeQra5KbJqzSb58S0yaDHoVAMBP3iidlPHesGl+U0AzAhxoY1jjrqm3xVH1BCc+k9fKYkyY6snL3PXJuyNdg/92JDCXjsvGlvhayBtYqT/wPFAk2a9yQIcvE8Vbowzcrhu/n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296016; c=relaxed/simple;
	bh=aKpvjxQE2cxbYVwFCB9w3ipI1Mgcj0HFiHSiP5oXTgc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LLZIn8yq4+MvYDx/iMbmekExaWjk8O2X9PnCszd2VaSGe/2V43uDRK8oqadgu/cn08yFAyT6ZqZn20pvbkBBdJp7FadbZBJxrmsq1A/fHHyU/W6JkIJMqunVIcCLe4zrasrckFP3ohORbSSC9Jg6bOYt06/hSiPFYGTIVFw+1og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNpwQQJe; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNpwQQJe"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso281790b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788296014; x=1788900814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z2yY3VWtNVXknR2xq/RckxnGM2GupuGqlN2wgAte6Tc=;
        b=bNpwQQJe2CY3xRKkhcLk7TKaZ8hT0zQqT0YwXGdZvSd7PtRpP7GJlfNDZ6zkPH7e6c
         kIhmats3vCfafJaViDU83PadNylsANB3snWeLkK212UT8n4QnVrBUh1C1Thw2lqgn4aw
         HkpqsT096owDSW3eQjibC6AYEJ3TbrRnLk+ihzzLkqF5jpkePjYuR6mmi2whjg62D5jo
         wsMhQe66MbIwyVoXjX7kJKatWjdwav8nkwKTwGG/oap/6Zl2Ceq5ARggdBxh1n3b1Fdz
         ML1j0VO4DXjz9ebJYB6Qo93kwRkSeyfZUBCjpSDIuk6X94KW3hbHWLlZM2976fbmUIU4
         brzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788296014; x=1788900814;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2yY3VWtNVXknR2xq/RckxnGM2GupuGqlN2wgAte6Tc=;
        b=gOuHtdWpHX+0voWML7XRq4KKzu+Ob4GDWAWZsctDhOjho6xKNXd/kUkwaBhv2e2/Ko
         BitWGjwtnwjFD+S73lHtFZd+PHuEfI6E9cN/rzfWq6mSVk83j1VblwU93Yj2+yV1WYqv
         ew/Sh+ob6ugKIQbiTboXUo8IsVZc2FwtfChOnQf07xBUKN84xxosM9xtoWDG1a8QNEln
         oQ/MZ8aW60PBI2udTOzg5gy5jU78NEsb7CLxpgTHGBqYZ8bliYhMp2y9xo8gMF2PdV1O
         JWDZHw9Gee99rPPpOmhizE+fJT1Ifk6UPAlEb9NgxqXsbvxo+/YHzEKzpUElRHcBhX0X
         W52w==
X-Forwarded-Encrypted: i=1; AHgh+RqObi7WPRujIwZFJ0qwvVE4dmG2Fx03nzQ1HgBZyjqPICqZgXhDdFX49WZlrFOn3r+ErDubV60DmeMpNNg=@vger.kernel.org
X-Gm-Message-State: AFuF++nuDWpK1t/5G2g2cIeBh0dt3TS/gBM79RSwBfzAG16c5XM/HhoY
	czLS5DCn3dpFOJwQ/qwSeiggCSMKEVniW3LtyxWbda1s7Thr/0uPYxEG
X-Gm-Gg: AR+sD13Ev76it9H1cvZrRFaNvIw5rdD8o6f89nSdwNMPkZ01714i9AoTK81gS8CXDvU
	dQoP3jmJow4LazsvfnRNnzswhhLIJgH4LOu8+OJRMGFZFvuMU4GkcSHdvSnMmM5PhXPISDwa37m
	VUTyzF2j7Yi9mEYeeKZ8DiebHrklOauAJgMntPe5omIElz6zAm6U1rWiPD1QJxb/x2TZ/SqQ6yr
	SnqFkfirTL4XXHvmSYpCpg6jTd35kpRRQA5WzFJYkEDH/XCaSvuDbyL3TiXJMEBtph6LV6ryr7o
	M2zOL8jJwWcQY3lqRVmg5YybBoKqjYKvd2z3LsFhZI5xdtwVxUhgzJa/cEwg7F2o85kyPX5ybpk
	qsSdzozBo4dK6jK9Rh+5O6m1XEA/Jt80wWDomMjq6DCcAdSA4DipAA+OcGWo0rCLhbqPbP1CmPn
	PUQs8dqRLuyHc6KcHg4pIDBYstK+SnifJfAk9/RXpOhMxaVoxX0TTaJEUamYPOFt9xDAkrpRSC6
	rLFEisLInwx4dxSbH7zzf75jL+ACKNeO8QtkvzoR5MQahrCoMi2KHASY+Ew
X-Received: by 2002:a05:6a00:1827:b0:857:72f8:dca6 with SMTP id d2e1a72fcca58-85bcacec80cmr6616693b3a.12.1788296013640;
        Tue, 01 Sep 2026 13:53:33 -0700 (PDT)
Received: from [10.21.0.95] (wnpgmb0592w-ds02-161-177-131.dynamic.bellmts.net. [207.161.177.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db30c5097sm375860b3a.26.2026.09.01.13.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 13:53:33 -0700 (PDT)
Message-ID: <d80cf68e-a6cb-4b0b-807e-313be29ca8ae@gmail.com>
Date: Tue, 1 Sep 2026 15:53:31 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
 <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
 <37132c40-aa82-4df1-b5ce-337601f3c085@gmail.com>
 <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
 <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
 <6e8761aa-67ef-4624-834d-4b9d0ce729d6@roeck-us.net>
 <9753ed80-5666-42a6-b04c-99b9ef9326fe@gmail.com>
 <5c17ea39-c479-4f88-adc6-9a86f3dfb96a@roeck-us.net>
Content-Language: en-US
In-Reply-To: <5c17ea39-c479-4f88-adc6-9a86f3dfb96a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Guenter,

I updated the piix4_transaction() (code below) to only print when there 
are failures. I then left the computer idle (~30 mins) while reading i2c 
info and SPD temps and I never saw any failures.

I then did some sleep and resume with cycles with spd5118 driver enabled 
and that is when I started to see the error messages again in dmesg.It 
appears like there is always a failure but not every failure causes 
corruption in MR11. From what I observed it seems like any `CMD=1a` 
cause failures but no corruption while whenever there is a `CMD=0b` 
there is failure and corruption. Not sure what that might mean be but it 
is something I observed.

I then ran sleep and resume cycles with spd5118 disabled but still 
polling i2c devices and could not produce any errors, however this was 
just done via my desktop gui console so the script might be getting 
suspended before whatever it is in the sleep cycle that is causing this 
issue to occur.


--- sleep/resume #1 ---
[  179.066004] [   T3736] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  179.066616] [   T3713] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  179.068576] [   T3736] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
             STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a7, DAT0=00, 
DAT1=18
             STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a7, DAT0=00, 
DAT1=18
             STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=1a, ADD=a7, 
DAT0=00, DAT1=18
             STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=00, 
DAT1=18
[  179.068814] [   T3713] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  179.068888] [   T3736] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00

--- sleep/resume #2 ---
[  235.947153] [   T3700] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  235.947827] [   T3699] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  235.951600] [   T3700] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
             STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a7, DAT0=00, 
DAT1=00
             STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a7, DAT0=00, 
DAT1=00
             STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, 
DAT0=ff, DAT1=00
             STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, 
DAT1=00
[  235.955119] [   T3699] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  235.955778] [   T3700] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x08

--- sleep/resume #3 ---
[  298.628115] [   T3703] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  298.629121] [   T3730] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  298.631589] [   T3730] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
             STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a3, DAT0=00, 
DAT1=18
             STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a3, DAT0=00, 
DAT1=18
             STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, 
DAT0=ff, DAT1=18
             STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, 
DAT1=18
[  298.636234] [   T3703] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  298.637812] [   T3730] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x08

--- sleep/resume #4 ---
[  631.979533] [   T3021] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  631.980193] [   T3017] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  631.983008] [   T3021] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
             STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a7, DAT0=00, 
DAT1=18
             STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a7, DAT0=00, 
DAT1=18
             STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, 
DAT0=ff, DAT1=18
             STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, 
DAT1=18
[  631.985028] [   T3021] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[  631.987201] [   T3017] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00

--- sleep/resume #5 ---
[ 1288.503455] [  T10850] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[ 1288.504462] [  T10813] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[ 1288.505927] [  T10850] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
             STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a7, DAT0=00, 
DAT1=18
             STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a7, DAT0=00, 
DAT1=18
             STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, 
DAT0=ff, DAT1=18
             STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, 
DAT1=18
[ 1288.511883] [  T10813] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[ 1288.512541] [  T10850] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x08


--- sleep/resume #6 ---
[ 1339.566042] [  T10863] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[ 1339.566679] [  T10887] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[ 1339.570157] [  T10887] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
             STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a3, DAT0=00, 
DAT1=18
             STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a3, DAT0=00, 
DAT1=18
             STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, 
DAT0=ff, DAT1=18
             STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, 
DAT1=18
[ 1339.572182] [  T10887] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[ 1339.573363] [  T10863] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00

--- piix4 transaction function ---
int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short 
piix4_smba)
{
     int temp;
     int result = 0;
     int timeout = 0;

     dev_dbg(&piix4_adapter->dev, "Transaction (pre): CNT=%02x, CMD=%02x, "
     "ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTCNT),
             inb_p(SMBHSTCMD), inb_p(SMBHSTADD), inb_p(SMBHSTDAT0),
             inb_p(SMBHSTDAT1));

     /* Register snapshot variables */
     u8 pre_cnt, pre_cmd, pre_add, pre_dat0, pre_dat1;
     u8 start_cnt, start_cmd, start_add, start_dat0, start_dat1;
     u8 postwait_sts, postwait_cnt, postwait_cmd, postwait_add, 
postwait_dat0, postwait_dat1;
     u8 post_cnt, post_cmd, post_add, post_dat0, post_dat1;

     /* Step 1: Read initial register state before starting */
     pre_cnt  = inb_p(SMBHSTCNT);
     pre_cmd  = inb_p(SMBHSTCMD);
     pre_add  = inb_p(SMBHSTADD);
     pre_dat0 = inb_p(SMBHSTDAT0);
     pre_dat1 = inb_p(SMBHSTDAT1);

     /* Make sure the SMBus host is ready to start transmitting */
     if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
         dev_dbg(&piix4_adapter->dev, "SMBus busy (%02x). 
Resetting...\n", temp);
         outb_p(temp, SMBHSTSTS);
         if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
             dev_err(&piix4_adapter->dev, "Failed! (%02x)\n", temp);
             return -EBUSY;
         }
     }

     /* Start the transaction by setting bit 6 */
     outb_p(inb(SMBHSTCNT) | 0x040, SMBHSTCNT);

     /* Step 2: Snapshot immediately after set start bit */
     start_cnt  = inb_p(SMBHSTCNT);
     start_cmd  = inb_p(SMBHSTCMD);
     start_add  = inb_p(SMBHSTADD);
     start_dat0 = inb_p(SMBHSTDAT0);
     start_dat1 = inb_p(SMBHSTDAT1);

     /* Wait for transaction completion */
     if (srvrworks_csb5_delay)
         usleep_range(2000, 2100);
     else
         usleep_range(250, 500);

     while ((++timeout < MAX_TIMEOUT) &&
         ((temp = inb_p(SMBHSTSTS)) & 0x01))
         usleep_range(250, 500);

     /* Step 3: Snapshot right after wait loop */
     postwait_sts  = temp;
     postwait_cnt  = inb_p(SMBHSTCNT);
     postwait_cmd  = inb_p(SMBHSTCMD);
     postwait_add  = inb_p(SMBHSTADD);
     postwait_dat0 = inb_p(SMBHSTDAT0);
     postwait_dat1 = inb_p(SMBHSTDAT1);

     if (timeout == MAX_TIMEOUT)
         result = -ETIMEDOUT;
     if (temp & 0x10)
         result = -EIO;
     if (temp & 0x08)
         result = -EIO;
     if (temp & 0x04)
         result = -ENXIO;

     if (inb_p(SMBHSTSTS) != 0x00)
         outb_p(inb(SMBHSTSTS), SMBHSTSTS);

     /* Step 4: Final snapshot */
     post_cnt  = inb_p(SMBHSTCNT);
     post_cmd  = inb_p(SMBHSTCMD);
     post_add  = inb_p(SMBHSTADD);
     post_dat0 = inb_p(SMBHSTDAT0);
     post_dat1 = inb_p(SMBHSTDAT1);

     /*
      * Dump full diagnostic trace ONLY if:
      * 1. Hardware registers were mutated (pre vs post mismatch on CMD 
or ADD)
      * 2. The bus operation returned an error code
      */
     if (pre_cmd != post_cmd || pre_add != post_add || result != 0) {
         dev_err(&piix4_adapter->dev,
                 "[PIIX4 ERROR TRACE TRIGGERED] result=%d\n"
                 "  STEP 1 (PRE-START)    : CNT=%02x, CMD=%02x, 
ADD=%02x, DAT0=%02x, DAT1=%02x\n"
                 "  STEP 2 (START BIT SET): CNT=%02x, CMD=%02x, 
ADD=%02x, DAT0=%02x, DAT1=%02x\n"
                 "  STEP 3 (POST-WAIT)    : STS=%02x, CNT=%02x, 
CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n"
                 "  STEP 4 (POST-CLEANUP) : CNT=%02x, CMD=%02x, 
ADD=%02x, DAT0=%02x, DAT1=%02x\n",
                 result,
                 pre_cnt, pre_cmd, pre_add, pre_dat0, pre_dat1,
                 start_cnt, start_cmd, start_add, start_dat0, start_dat1,
                 postwait_sts, postwait_cnt, postwait_cmd, postwait_add, 
postwait_dat0, postwait_dat1,
                 post_cnt, post_cmd, post_add, post_dat0, post_dat1);
     }

     if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
         dev_err(&piix4_adapter->dev, "Failed reset at end of "
         "transaction (%02x)\n", temp);
     }
     dev_dbg(&piix4_adapter->dev, "Transaction (post): CNT=%02x, CMD=%02x, "
     "ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTCNT),
             inb_p(SMBHSTCMD), inb_p(SMBHSTADD), inb_p(SMBHSTDAT0),
             inb_p(SMBHSTDAT1));

     return result;
}


Thanks,
Matthew

On 9/1/26 12:04 PM, Guenter Roeck wrote:
> Hi Matthew,
> 
> On 9/1/26 09:31, Matthew Bettencourt wrote:
>> Hello Guenter,
>>
>> I added additional logging into the piix4_transaction(). I will put 
>> the function call on the bottom. But as you guessed we are seeing not 
>> just MR11 corruption but also can trigger on other addresses as well. 
>> I was running the suspend/resume cycle and caught on both MR11 issue 
>> and else where. Here is the dmesg log output.
>>
>> --- Other PIIX4 transation ---
> ...
>> [29287.881787] [ T204580] i2c i2c-12: [PIIX4 REGISTER MUTATION 
>> DETECTED] Pre: (CMD=0x1a, ADD=0xa3) -> Post: (CMD=0x01, ADD=0x45) | 
>> DAT0=0xff
> ...
>> [29312.945873] [ T204570] i2c i2c-12: [PIIX4 REGISTER MUTATION 
>> DETECTED] Pre: (CMD=0x0b, ADD=0xa7) -> Post: (CMD=0x01, ADD=0x45) | 
>> DAT0=0xff
> 
> It may be a coincidence, but the two failed accesses are exactly 25 
> seconds apart.
> 
> Would it be possible to drop the messages except for the failures and 
> run long-term
> accesses (for example by reading the temperatures and/or the nvmem 
> continuously) ?
> You should find the nvmem at /sys/bus/nvmem/devices/0-005[13]/nvmem.
> 
> It might be useful to know if this only happens during suspend/resume 
> cycles
> or if it happens all the time, if it happens randomly or in specific 
> intervals,
> and if the failure pattern is always the same.
> 
> Thanks,
> Guenter
> 

